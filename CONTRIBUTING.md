# Contributing to newpipeextractor_dart

Thank you for your interest in contributing! This guide covers everything you need to get started.

## Table of Contents

- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Architecture Deep Dive](#architecture-deep-dive)
  - [Three-Layer Design](#three-layer-design)
  - [Pagination State Model](#pagination-state-model)
  - [reCAPTCHA Flow (End-to-End)](#recaptcha-flow-end-to-end)
  - [Error Handling Patterns](#error-handling-patterns)
  - [YouTube-Specific vs Multi-Service APIs](#youtube-specific-vs-multi-service-apis)
  - [Bumping NewPipe Extractor Version](#bumping-newpipe-extractor-version)
  - [Testing Against Live Services](#testing-against-live-services)
- [Development Setup](#development-setup)
- [How to Contribute](#how-to-contribute)
- [Adding a New Feature](#adding-a-new-feature)
- [Code Style](#code-style)
- [Testing](#testing)
- [Pull Request Process](#pull-request-process)
- [Reporting Issues](#reporting-issues)

## Getting Started

### Prerequisites

- Flutter SDK 3.10+
- Dart SDK >=3.0.0
- Android SDK with compileSdk 35
- Android device or emulator (minSdk 22)
- Java 8+ (for NewPipe Extractor compilation)

### Clone and setup

```bash
git clone https://github.com/OttomanDeveloper/NewPipeExtractor_Dart.git
cd NewPipeExtractor_Dart
flutter pub get
```

## Project Structure

```
newpipeextractor_dart/
├── pigeons/                          # Pigeon API definition (source of truth for the bridge)
│   └── extractor_api.dart
├── android/
│   └── src/main/
│       ├── kotlin/.../               # Kotlin implementations of Pigeon APIs
│       │   ├── ExtractorHelper.kt    # DTO mapping (NewPipe → Pigeon DTOs)
│       │   ├── NewpipeextractorDartPlugin.kt  # Plugin registration
│       │   └── api/                  # One file per Pigeon HostApi
│       └── java/.../downloader/      # HTTP client (DownloaderImpl.java)
├── lib/
│   ├── newpipeextractor_dart.dart    # Barrel file (public API)
│   └── src/
│       ├── generated/                # Pigeon-generated code (DO NOT EDIT)
│       ├── extractors/               # Dart extractors (call Pigeon APIs)
│       │   └── dto_mapper.dart       # DTO → freezed model mapping
│       ├── models/                   # Freezed data models
│       ├── exceptions/               # Sealed exception hierarchy
│       └── utils/                    # HTTP client, reCAPTCHA
├── test/                             # Unit tests
├── example/                          # Example Flutter app
└── docs/                             # Design specs and plans
```

### Architecture

The plugin has three layers:

```
Flutter App
    ↕  (import package)
Dart Extractors + Freezed Models (lib/src/)
    ↕  (Pigeon-generated type-safe bridge)
Kotlin API Implementations (android/src/main/kotlin/)
    ↕  (Java interop)
NewPipe Extractor Library (v0.26.3)
```

**Data flows like this:**
1. Dart extractor calls Pigeon-generated API
2. Pigeon routes to Kotlin implementation on a background thread
3. Kotlin calls NewPipe Extractor, maps result to Pigeon DTO
4. Pigeon serializes DTO back to Dart
5. Dart extractor maps DTO to public freezed model via `dto_mapper.dart`

## Architecture Deep Dive

### Three-Layer Design

The package has three distinct layers, each with a specific job. Understanding why they are separate is the single most important thing for contributors.

**Layer 1: Pigeon DTOs (generated, internal)**

Defined in `pigeons/extractor_api.dart`. Running `dart run pigeon` generates both a Dart file (`lib/src/generated/extractor_api.g.dart`) and a Kotlin file (`ExtractorApi.g.kt`). These DTOs are auto-serialized across the platform channel. All fields are nullable because Pigeon generates them that way. They carry no behavior, no equality, no immutability guarantees. Consumers of this package never import or see these types.

**Layer 2: Kotlin implementations (native, internal)**

Each file in `android/.../api/` implements a Pigeon `HostApi`. These classes call NewPipe Extractor on a background thread (`executor.execute { ... }`), map Java objects to Pigeon DTOs using helper functions in `ExtractorHelper.kt`, and post results back to the main thread via `handler.post { callback(Result.success(dto)) }`. This layer owns threading, error handling for reCAPTCHA, and the `tryOrNull` pattern for resilient field extraction.

**Layer 3: Dart extractors + freezed models (public API)**

This is what consumers of the package import. Dart extractors (e.g., `SearchExtractor`, `VideoExtractor`) are static-method classes that call the Pigeon API, then map the returned DTOs to freezed models using `dto_mapper.dart`. Freezed models provide immutability, `==` equality, `copyWith`, JSON serialization, and a stable public API.

**Why the separation matters:**

Pigeon DTOs are generated code with nullable everything and no behavior. If consumers depended on them directly, every Pigeon regeneration would be a breaking change. Freezed models decouple the public API from Pigeon's constraints: you can add a field to the bridge, default it to a sensible value in `dto_mapper.dart`, and consumers see zero breakage. The mapper layer (`dto_mapper.dart`) also handles the nullable-to-non-nullable coercion (e.g., `d.isShort ?? false`, `d.tags?.whereType<String>().toList() ?? []`), keeping that noise out of both the Kotlin side and the consumer-facing models.

### Pagination State Model

Search, comments, channel uploads, and playlist streams all use **stateful pagination**. This is a critical design detail.

**How it works:**

1. The Kotlin implementation class (e.g., `SearchApiImpl`) stores the NewPipe `SearchExtractor` instance and the current `InfoItemsPage` as member fields after the initial call.

```kotlin
// SearchApiImpl.kt
private var searchExtractor: SearchExtractor? = null
private var searchPage: ListExtractor.InfoItemsPage<InfoItem>? = null
```

2. When you call `searchYoutube(query, filters)`, Kotlin creates a new extractor, fetches the first page, stores both the extractor and the page, and returns results.

3. Calling `getNextPage()` uses the stored extractor and page to fetch the next page. It then replaces the stored page with the new one.

4. Calling a NEW search (different query or filters) **replaces** the stored extractor and page. The previous search's pagination state is destroyed.

**What this means for consumers:**

- You CANNOT interleave two different YouTube searches. Starting search B destroys the pagination state of search A.
- You CAN paginate one YouTube search and one YouTube Music search simultaneously, because `SearchApiImpl` stores them in separate fields (`searchExtractor` vs `musicExtractor`).
- Service-specific APIs (`ServiceSearchApiImpl`) store state per `serviceId` in a `mutableMapOf<Long, SearchExtractor>()`, so you CAN paginate searches on YouTube and SoundCloud at the same time.

```kotlin
// ServiceSearchApiImpl.kt — state keyed by serviceId
private val extractors = mutableMapOf<Long, SearchExtractor>()
private val pages = mutableMapOf<Long, ListExtractor.InfoItemsPage<InfoItem>>()
```

**This is a deliberate trade-off.** Storing one extractor per API (or per serviceId) keeps memory low and the API surface simple. Supporting concurrent pagination for the same service would require the Dart side to manage opaque page tokens, which adds complexity for a use case most apps never need.

### reCAPTCHA Flow (End-to-End)

YouTube rate-limits automated requests. When it does, the entire package handles it through a 10-step flow that spans Kotlin, Pigeon, Dart, and a WebView. Understanding this flow is essential if you are working on any extractor or the cookie system.

**Step 1:** YouTube returns HTTP 429. NewPipe Extractor throws a `ReCaptchaException` containing the challenge URL.

**Step 2:** The Kotlin catch block calls `e.toFlutterResult()`. This extension function (defined in `ExtractorHelper.kt`) detects `ReCaptchaException` specifically and wraps it as a `FlutterError("RECAPTCHA", message, challengeUrl)`:

```kotlin
fun Exception.toFlutterResult(): Result<Nothing> {
    return if (this is ReCaptchaException) {
        Result.failure(FlutterError("RECAPTCHA", this.message, this.url))
    } else {
        Result.failure(this)
    }
}
```

**Step 3:** Pigeon delivers the `FlutterError` to Dart as a `PlatformException` with `code == "RECAPTCHA"` and `details` containing the challenge URL.

**Step 4:** Every Dart extractor wraps its Pigeon call in `withReCaptchaRetry()`. This function catches `PlatformException` with code `"RECAPTCHA"` and extracts the URL from `e.details`:

```dart
Future<T> withReCaptchaRetry<T>(Future<T> Function() call) async {
  try {
    return await call();
  } on PlatformException catch (e) {
    if (e.code == 'RECAPTCHA' && _reCaptchaNavigator != null) {
      final url = (e.details as String?) ?? e.message ?? '';
      await _reCaptchaNavigator!(url);
      return await call();
    }
    rethrow;
  }
}
```

**Step 5:** `withReCaptchaRetry` calls the registered `ReCaptchaNavigator` callback. The consumer app registers this via `setReCaptchaNavigator()` at startup — typically navigating to a route that shows `ReCaptchaPage`.

**Step 6:** `ReCaptchaPage` (provided by the package in `lib/src/utils/recaptcha_page.dart`) shows the challenge URL in an `InAppWebView`. The user solves the CAPTCHA.

**Step 7:** When the user taps the confirm button, `ReCaptchaPage` extracts cookies from the WebView, looking specifically for `s_gl=`, `goojf=`, `VISITOR_INFO1_LIVE=`, and `GOOGLE_ABUSE_EXEMPTION=` cookies. It also checks the URL for a `google_abuse` query parameter.

**Step 8:** `ReCaptchaPage` calls `CookieApi.setCookie()` to persist the collected cookies to the native `DownloaderImpl` and SharedPreferences. This ensures subsequent requests include the anti-CAPTCHA cookie.

**Step 9:** `ReCaptchaPage` pops, returning control to `withReCaptchaRetry()`, which retries the original call. This time the request includes the valid cookie.

**Step 10:** Subsequent requests from `DownloaderImpl` automatically include the persisted cookie, so the CAPTCHA challenge should not reappear immediately.

**Key point for contributors:** Always use `withReCaptchaRetry()` in Dart extractors. If you skip it, the consumer has no way to recover from a CAPTCHA challenge. Always use `e.toFlutterResult()` in Kotlin catch blocks — using `Result.failure(e)` directly would lose the structured RECAPTCHA error code.

### Error Handling Patterns

The package uses three layers of error handling. Each catches a different class of problem.

**Kotlin: `tryOrNull { }` — resilient field extraction**

Defined in `ExtractorHelper.kt` as:

```kotlin
inline fun <T> tryOrNull(block: () -> T): T? {
    return try { block() } catch (_: Exception) { null }
}
```

Used when building Pigeon DTOs. NewPipe Extractor can throw `ParsingException` on any individual field (e.g., `getCategory()`, `getLikeCount()`). Wrapping each field in `tryOrNull` means one broken field produces a `null` in the DTO instead of crashing the entire extraction:

```kotlin
VideoInfoDto(
    id = tryOrNull { extractor.id },
    category = tryOrNull { extractor.category },
    likeCount = tryOrNull { extractor.likeCount },
    // ... every field individually wrapped
)
```

**Kotlin: `e.toFlutterResult()` — structured error propagation**

Used in every catch block in every API implementation. Converts `ReCaptchaException` to a structured `FlutterError("RECAPTCHA", ...)` so Dart can handle it specially. All other exceptions propagate as-is through Pigeon.

**Dart: `withReCaptchaRetry()` — CAPTCHA recovery**

Wraps every extractor call. Catches `PlatformException` with code `"RECAPTCHA"` and handles the challenge flow (see reCAPTCHA Flow above). Non-RECAPTCHA exceptions propagate to the consumer.

**Dart: sealed `ExtractorException` — consumer-facing errors**

The `ExtractorHttpClient` (the Dart HTTP client) throws sealed `ExtractorException` subtypes for HTTP-level errors. Consumers can pattern-match on these in their own error handling:

```dart
sealed class ExtractorException implements Exception {
  String get message;
}
```

**Rule for contributors:** Use `tryOrNull` for individual field extractions in Kotlin. Use `e.toFlutterResult()` in catch blocks (never bare `Result.failure(e)`). Use `withReCaptchaRetry()` in Dart extractors. Do not invent new error propagation mechanisms.

### YouTube-Specific vs Multi-Service APIs

The package exposes two parallel API surfaces. Know which one you are working on.

**YouTube-specific APIs:**

- Classes: `SearchExtractor`, `VideoExtractor`, `ChannelExtractor`, `PlaylistExtractor`, `CommentsExtractor`
- Kotlin: `SearchApiImpl`, `VideoApiImpl`, `ChannelApiImpl`, `PlaylistApiImpl`, `CommentsApiImpl`
- Hardcoded to `ServiceList.YouTube`
- Has YouTube-only features: channel tabs, YouTube Music search, kiosk names
- Simpler API — no `serviceId` parameter
- **Use these when you only need YouTube.**

**Multi-service APIs:**

- Dart: `ServiceExtractor` and its methods
- Kotlin: `ServiceSearchApiImpl`, `ServiceStreamApiImpl`, `ServiceChannelApiImpl`, `ServicePlaylistApiImpl`, `ServiceKioskApiImpl`
- Take a `serviceId` parameter — works with YouTube (`0`), SoundCloud (`1`), media.ccc.de (`2`), PeerTube (`3`), Bandcamp (`4`)
- Generic interface — only features common across all services
- Use the `ServiceId` enum for type-safe service selection
- Pagination state stored per `serviceId`, so different services can paginate independently

```dart
enum ServiceId {
  youtube(0),
  soundCloud(1),
  mediaCccDe(2),
  peerTube(3),
  bandcamp(4);

  final int value;
  const ServiceId(this.value);
}
```

Both API surfaces use the same Pigeon DTOs and freezed models. When adding a feature, decide first whether it is YouTube-specific or truly cross-service. If it only applies to YouTube, add it to the YouTube-specific API. If it applies to all services, add it to the multi-service API. Do not duplicate the same feature in both.

### Bumping NewPipe Extractor Version

When NewPipe Extractor releases a new version (usually to fix YouTube breakage), follow these steps:

1. **Check the changelog.** Read the [NewPipe Extractor releases](https://github.com/TeamNewPipe/NewPipeExtractor/releases) page. Look for breaking API changes: renamed methods, changed return types, removed classes, new required parameters.

2. **Update the dependency.** In `android/build.gradle`, change the version:
   ```groovy
   implementation 'com.github.teamnewpipe:NewPipeExtractor:vX.Y.Z'
   ```

3. **Fix `ExtractorHelper.kt`.** If any NewPipe API methods changed signatures or return types, update the mapping functions (`mapVideoInfo`, `mapChannel`, `categorizeInfoItems`, etc.). Compile errors will guide you.

4. **Fix Kotlin API implementations.** Check each file in `android/.../api/` for calls to NewPipe Extractor methods that may have changed. The compiler will flag these.

5. **Test on a real device.** Extraction can fail silently (returning empty results instead of errors). Run the example app, test search, video info, channel info, playlist, comments, and trending. See [Testing Against Live Services](#testing-against-live-services).

6. **Update metadata.**
   - `README.md` — update the version reference
   - `CHANGELOG.md` — add entry under `## Unreleased`

7. **Commit with:** `chore: bump NewPipe Extractor to vX.Y.Z`

Common gotcha: NewPipe Extractor sometimes adds new fields to existing extractors that we do not yet map. These are not breaking, but you should check if any new fields are worth exposing via `tryOrNull` + a new DTO field + a new freezed model field.

### Testing Against Live Services

There is no mock server. NewPipe Extractor talks directly to YouTube, SoundCloud, Bandcamp, PeerTube, and media.ccc.de. Testing means hitting the real services.

**How to test:**

1. Run the example app on a **real Android device** (emulators work but can behave differently with network).
2. Test each extractor: search, video info, channel info, playlist, comments, trending/kiosk.
3. For multi-service APIs, test at least YouTube and SoundCloud.

**What to expect:**

- YouTube **will** rate-limit you during heavy testing. reCAPTCHA challenges are normal. If you see them constantly, wait 10-15 minutes or switch networks.
- Some features work on YouTube but not on other services (e.g., channel tabs, music search). This is expected.
- Extraction can fail silently — a field returning `null` or an empty list does not always mean something is broken. Check if the source page actually has that data.

**Integration tests:**

- Any integration test that hits a live service should be marked `@Skip` by default and run manually. Live services change without notice, so these tests cannot be part of CI.
- After a NewPipe Extractor version bump, always re-test all extractors manually. A version bump is the most common time for subtle breakage.

## Development Setup

### Regenerate Pigeon bridge

After editing `pigeons/extractor_api.dart`:

```bash
dart run pigeon --input pigeons/extractor_api.dart
```

This regenerates:
- `lib/src/generated/extractor_api.g.dart` (Dart)
- `android/src/main/kotlin/.../ExtractorApi.g.kt` (Kotlin)

### Regenerate freezed models

After editing any `@freezed` model in `lib/src/models/`:

```bash
dart run build_runner build
```

### Run analysis and tests

```bash
dart analyze
flutter test
```

## How to Contribute

### Types of contributions welcome

- **Bug fixes** — especially YouTube extraction failures (these happen when YouTube changes their API)
- **New features** — exposing more NewPipe Extractor capabilities
- **Non-YouTube services** — improving SoundCloud, Bandcamp, PeerTube, media.ccc.de support
- **Tests** — expanding test coverage
- **Documentation** — improving README, examples, API docs
- **Performance** — reducing network calls, memory usage

### Not looking for

- iOS/web/desktop support (this is architecturally Android-only via NewPipe Extractor)
- Alternative extraction backends (the plugin is specifically a NewPipe Extractor wrapper)

## Adding a New Feature

A new extraction feature typically touches 5 files. Follow the patterns described in the [Architecture Deep Dive](#architecture-deep-dive) section.

### 1. Pigeon definition (`pigeons/extractor_api.dart`)

Add new DTO fields or new HostApi methods:

```dart
// New field on existing DTO
class VideoInfoDto {
  // ... existing fields ...
  String? newField;  // Add here
}

// Or new API method
@HostApi()
abstract class VideoExtractorApi {
  // ... existing methods ...
  @async
  SomeDto newMethod(String param);  // Add here
}
```

### 2. Kotlin implementation (`android/.../api/XxxApiImpl.kt`)

Implement the new method or map the new field. Use `e.toFlutterResult()` in catch blocks — never use bare `Result.failure(e)`, which would lose the structured RECAPTCHA error code. Use `tryOrNull` for individual field extractions to prevent one broken field from crashing the entire DTO construction:

```kotlin
override fun newMethod(param: String, callback: (Result<SomeDto>) -> Unit) {
    executor.execute {
        try {
            // Call NewPipe Extractor
            val result = SomeDto(
                name = tryOrNull { extractor.name },   // resilient per-field extraction
                count = tryOrNull { extractor.count },
            )
            handler.post { callback(Result.success(result)) }
        } catch (e: Exception) {
            handler.post { callback(e.toFlutterResult()) }  // NOT Result.failure(e)
        }
    }
}
```

### 3. Freezed model (`lib/src/models/xxx.dart`)

Add the new field:

```dart
@freezed
class Xxx with _$Xxx {
  const factory Xxx({
    // ... existing fields ...
    String? newField,  // Add here
  }) = _Xxx;

  factory Xxx.fromJson(Map<String, dynamic> json) => _$XxxFromJson(json);
}
```

### 4. DTO mapper (`lib/src/extractors/dto_mapper.dart`)

Map the new DTO field to the model. Handle nullability here — coerce nullable DTO fields to sensible defaults so the freezed model can use non-nullable types where appropriate:

```dart
Xxx mapXxx(XxxDto d) => Xxx(
  // ... existing mappings ...
  newField: d.newField,                                    // nullable stays nullable
  count: d.count ?? 0,                                     // nullable → non-nullable with default
  items: d.items?.whereType<String>().toList() ?? [],       // nullable list → non-nullable list
);
```

### 5. Dart extractor (`lib/src/extractors/xxx_extractor.dart`)

Expose the new method. Always wrap the Pigeon call in `withReCaptchaRetry()` so CAPTCHA challenges are handled automatically:

```dart
static Future<SomeModel> newMethod(String param) async {
  final dto = await withReCaptchaRetry(() => _api.newMethod(param));
  return m.mapSomeModel(dto);
}
```

### Then regenerate and test:

```bash
dart run pigeon --input pigeons/extractor_api.dart
dart run build_runner build
dart analyze
flutter test
```

## Code Style

### Dart
- Follow `analysis_options.yaml` (based on `flutter_lints`)
- Use single quotes for strings
- Use `const` constructors where possible
- All models must be `@freezed`
- Extractors use static methods only
- DTO mapping goes in `dto_mapper.dart`, not in extractors
- Handle nullable Pigeon types with `.whereType<T>().toList()` or `?? default`

### Kotlin
- Follow standard Kotlin conventions
- All NewPipe calls must run on the `executor` thread
- Results posted to main thread via `handler.post { }`
- Use `ExtractorHelper.tryOrNull { }` for fields that may throw `ParsingException`
- Use `e.toFlutterResult()` in catch blocks (propagates reCAPTCHA as FlutterError)
- Construct Pigeon DTOs via named constructor parameters (they are `data class`)

### Commit messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: add subtitle language filtering
fix: handle null duration in SoundCloud streams
chore: bump NewPipe Extractor to v0.27.0
docs: add SoundCloud usage examples
test: add serialization tests for SubtitleStream
```

## Testing

### Current test coverage

```bash
flutter test
```

Tests cover:
- Enum `fromString` mapping
- Extension method stream quality selection
- Sealed exception pattern matching

### Writing new tests

Place tests under `test/` mirroring the `lib/src/` structure:

```
test/
├── models/
│   ├── enums_test.dart
│   └── youtube_video_extensions_test.dart
└── exceptions/
    └── extractor_exception_test.dart
```

Model serialization tests:

```dart
test('VideoInfo round-trips through JSON', () {
  const info = VideoInfo(id: 'abc', name: 'Test Video');
  final json = info.toJson();
  final restored = VideoInfo.fromJson(json);
  expect(restored, equals(info));
});
```

## Pull Request Process

1. **Fork** the repository
2. **Create a branch** from `master`: `git checkout -b feat/my-feature`
3. **Make your changes** following the code style above
4. **Regenerate** Pigeon and freezed if you changed definitions or models
5. **Run analysis and tests**: `dart analyze && flutter test`
6. **Commit** with conventional commit messages
7. **Push** and open a pull request against `master`
8. **Describe** what you changed and why in the PR description

### PR checklist

- [ ] `dart analyze` passes with zero errors
- [ ] `flutter test` passes all tests
- [ ] Pigeon regenerated if `pigeons/extractor_api.dart` was modified
- [ ] Freezed regenerated if any model was modified
- [ ] New features include tests
- [ ] README updated if public API changed
- [ ] CHANGELOG.md updated under `## Unreleased`

## Reporting Issues

### YouTube extraction broken

YouTube frequently changes their internal API, which breaks extraction. If you see errors like `FatalFailureException` or extraction returning empty results:

1. Check if [NewPipe Extractor](https://github.com/TeamNewPipe/NewPipeExtractor/releases) has a newer version
2. Open an issue with:
   - The URL that fails
   - The error message / stack trace
   - Your Flutter/Dart/Android SDK versions
   - Whether it worked before (and when it stopped)

### Other issues

Open an issue at [GitHub Issues](https://github.com/OttomanDeveloper/NewPipeExtractor_Dart/issues) with:

- Steps to reproduce
- Expected vs actual behavior
- Environment details (Flutter version, device, Android version)
- Minimal code example if possible

---

Thank you for contributing!
