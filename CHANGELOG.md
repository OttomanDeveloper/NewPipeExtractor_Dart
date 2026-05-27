## 1.0.1

* Added pub.dev badges and updated installation instructions
* Documentation improvements across all public API surfaces
* Comprehensive CONTRIBUTING guide with architecture deep-dive

## 1.0.0

### Breaking Changes
- Complete rewrite — all existing APIs have changed
- Replaced raw `MethodChannel` with type-safe Pigeon bridge
- Replaced handwritten models with immutable `freezed` data classes
- Replaced Java native layer with Kotlin
- Rebranded package to `com.ottomancoder`
- Dart SDK minimum raised from 2.17.5 to 3.0.0
- All model constructors changed (now use named parameters with `const factory`)
- `YoutubeSearch` and `YoutubeMusicSearch` merged into `SearchResult`
- Exception classes consolidated into sealed `ExtractorException` hierarchy

### New Features
- **Multi-service support** — SoundCloud, Bandcamp, PeerTube, media.ccc.de via `ServiceExtractor`
- **Subtitles/captions** — extract subtitle tracks with language, format, auto-generated flag
- **Live stream support** — `StreamType` enum, HLS/DASH manifest URLs
- **Comment pagination** — `getNextCommentsPage()` for scrolling through all comments
- **Comment replies** — `getCommentReplies(index)` to load reply threads
- **Search suggestions** — `getSearchSuggestions(query)` for autocomplete
- **Channel tabs** — browse Videos, Shorts, Live, Playlists, Channels, Albums tabs
- **Playlist pagination** — `getPlaylistNextPage()` for large playlists
- **Kiosk support** — `listKiosks()` and `getKioskContent(kioskId)` for Trending, Top 50, etc.
- **URL validation** — `isValidStreamUrl()`, `isValidPlaylistUrl()`, `isValidChannelUrl()`
- **Localization control** — `setLocalization(languageCode, countryCode)` for content language
- **Cookie management** — `CookieExtractor` for setting/getting cookies
- **Shorts detection** — `isShort` flag on `VideoInfo` and `StreamInfoItem`
- **Verified badges** — `isUploaderVerified` on videos, `isVerified` on channels and comments
- **FPS info** — `fps` field on `VideoOnlyStream` and `VideoStream`
- **Storyboard frames** — `Frameset` model with preview thumbnail grids
- **Audio track info** — `audioTrackName`, `audioTrackLocale`, `audioTrackType` for multi-audio videos
- **Playlist metadata** — `description` and `playlistType` (normal, mix, album)
- **Video metadata** — `uploaderSubscriberCount`, `subChannelName/Url/Avatars`, `licence`, `supportInfo`, `privacy`
- **Comment metadata** — `isChannelOwner`, `isUploaderVerified`, `streamPosition`, `replyCount`
- **Thumbnails on list items** — `StreamInfoItem.thumbnails` for search results, trending, playlists
- **Extension methods** — `videoOnlyWithHighestQuality`, `audioWithBestAacQuality`, `bestAudioForVideo()`, etc.

### Improvements
- **Extractor caching** — `VideoExtractorApiImpl` caches the stream extractor by URL, preventing duplicate `fetchPage()` calls
- **reCAPTCHA propagation** — challenges now propagate as structured `FlutterError("RECAPTCHA")` for automatic retry
- **Thread safety** — `ConcurrentHashMap` for cookies, executor shutdown on detach
- **Error handling** — all service extractors wrap property access in try-catch for resilience across services
- **Typed HTTP client** — `getStream()` uses explicit `url`/`size` parameters instead of `dynamic`

### Upgraded Dependencies
- NewPipe Extractor: v0.24.2 → v0.26.2
- Gradle: 4.1.0 → 8.1.0
- OkHttp: 3.12.13 → 4.12.0
- Gson: 2.8.6 → 2.11.0
- compileSdk: 34 → 35
- desugar_jdk_libs: 1.1.1 → 2.1.4

### Bug Fixes
- Fixed cookie null check in plugin initialization
- Fixed typo in `transistentFailureException.dart` → `transientFailureException.dart`
- Fixed trending extractor after default kiosk changed from "Trending" to "Live" in v0.24.8
- Fixed variable shadowing in `ExtractorHttpClient.getStream` that caused crash on retry
- Fixed HTTP client connection leak on error paths
- Fixed `audioWithBestAacQuality`/`audioWithBestOggQuality` comparing `formatName` instead of `formatSuffix`
- Fixed empty locale country fallback (now defaults to "US")
- Removed debug cookie logging from `DownloaderImpl`

## 0.0.2

* Minor updates

## 0.0.1

* Initial Release
