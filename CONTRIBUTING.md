# Contributing to newpipeextractor_dart

Thank you for your interest in contributing! This guide covers everything you need to get started.

## Table of Contents

- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
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
NewPipe Extractor Library (v0.26.2)
```

**Data flows like this:**
1. Dart extractor calls Pigeon-generated API
2. Pigeon routes to Kotlin implementation on a background thread
3. Kotlin calls NewPipe Extractor, maps result to Pigeon DTO
4. Pigeon serializes DTO back to Dart
5. Dart extractor maps DTO to public freezed model via `dto_mapper.dart`

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
dart run build_runner build --delete-conflicting-outputs
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

A new extraction feature typically touches 5 files:

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

Implement the new method or map the new field:

```kotlin
override fun newMethod(param: String, callback: (Result<SomeDto>) -> Unit) {
    executor.execute {
        try {
            // Call NewPipe Extractor
            val result = ...
            handler.post { callback(Result.success(result)) }
        } catch (e: Exception) {
            handler.post { callback(e.toFlutterResult()) }
        }
    }
}
```

Always use `e.toFlutterResult()` (not `Result.failure(e)`) to properly propagate reCAPTCHA challenges.

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

Map the new DTO field to the model:

```dart
Xxx mapXxx(XxxDto d) => Xxx(
  // ... existing mappings ...
  newField: d.newField,
);
```

### 5. Dart extractor (`lib/src/extractors/xxx_extractor.dart`)

Expose the new method:

```dart
static Future<SomeModel> newMethod(String param) async {
  final dto = await withReCaptchaRetry(() => _api.newMethod(param));
  return m.mapSomeModel(dto);
}
```

### Then regenerate and test:

```bash
dart run pigeon --input pigeons/extractor_api.dart
dart run build_runner build --delete-conflicting-outputs
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
