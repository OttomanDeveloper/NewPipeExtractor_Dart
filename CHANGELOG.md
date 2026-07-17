## 2.0.1

Upgraded the bundled NewPipe Extractor from v0.26.2 to v0.26.3.

### Fixed (via upstream)

* **YouTube stream extraction works around SABR enforcement** by using a
  different player client — restores stream URL extraction where YouTube had
  begun rejecting the previous client.
* Playlist items and several properties in YouTube "lockup" view models
  (view count, upload date) extract correctly again.
* Audio track type is now derived from format xTags, so
  `AudioOnlyStream.audioTrackType` / `audioTrackName` / `audioTrackLocale`
  are populated more reliably on multi-audio videos.

### Changed (via upstream)

* Livestreams that expose only DASH/HLS manifests no longer fail extraction:
  `getVideoStreams` can return empty stream lists while `VideoInfo.hlsUrl` /
  `VideoInfo.dashMpdUrl` are set. Consumers should fall back to those URLs
  when the stream lists are empty.

## 2.0.0

Relicensed to GPL-3.0, plus stateless token-based list pagination so multiple
feeds can page independently without sharing a single native cursor.

### Breaking changes

* **Relicensed from BSD-3-Clause to GPL-3.0.** This package wraps NewPipe
  Extractor (GPL-3.0); the license now matches it. Applications that use this
  package are subject to the GPL-3.0. See `LICENSE` and `NOTICE`.
* **Pagination is now driven by `PageToken` instead of internal cursors.** Each
  list call returns its items plus a continuation token; pass that token back to
  fetch the next page. This lets independent lists (e.g. several category feeds
  plus search) paginate concurrently without clobbering each other.
  * New types: `PageToken`, `PageDto`, `StreamListPageDto`, and the `StreamPage`
    / `SearchPage` typedefs (`({items, next})` / `({result, next})`).
  * `searchYoutube` / `searchYoutubeMusic` now return the result **plus** a `next`
    token. The no-arg `getNextPage()` / `getNextMusicPage()` are replaced by
    `searchNextPage(query, filters, token)` / `searchMusicNextPage(query, filters, token)`.
  * `getChannelUploads` / `getPlaylistStreams` / `getTrendingVideos` /
    `getKioskContent` now return `({items, next})` instead of a bare list.
  * `getChannelNextPage(url, token)`, `getChannelTabNextPage(url, tabFilter, token)`,
    `getPlaylistNextPage(url, token)` replace their no-arg predecessors; added
    `getTrendingNextPage(token)` and `getKioskNextPage(kioskId, token)`.
  * Channel-tab results now also carry a `next` token.

### Improvements

* **Network timeouts** — `DownloaderImpl` now sets `connectTimeout` (15s),
  `writeTimeout` (30s), and a total `callTimeout` (45s) in addition to the
  existing read timeout, so a stalled request can no longer hold a worker
  thread indefinitely.

### Fixes

* Fixed `NetworkOnMainThreadException` (crash) when opening a trending/kiosk
  feed — `getKioskContent` was performing the network fetch inside the
  main-thread callback post; extraction now runs entirely on the worker pool
  and only the result is delivered to the main thread.

### Internal

* New `ExtractorHelper` page helpers: `mapPage`, `pageFromDto`, `streamListPage`;
  removed the per-API stateful extractor/page fields now that pagination is
  stateless.

## 1.1.0

Closes the remaining NewPipe Extractor coverage gaps (all additive — no breaking changes):

* **Subscriptions** — new `SubscriptionExtractor` reads subscription lists from public
  channel URLs (`fromChannelUrl`) or exported files (`fromFile`), with `getSupportedSources`
  / `getRelatedUrl`. Read-only extraction, not account login.
* **Generic comments** — `ServiceExtractor.getComments` / `getCommentsNextPage` extract
  comments on any service whose extractor supports them (previously YouTube-only).
* **Generic channel tabs** — `ServiceExtractor.getChannelTabContent` / `getChannelTabNextPage`
  fetch arbitrary channel-tab content for non-YouTube services that expose tabs.
* **Localization read APIs** — `LocalizationExtractor.getSupportedLocalizations` /
  `getSupportedCountries` enumerate the languages/countries a service supports.
* Internal: shared comment + tab-item mappers in `ExtractorHelper`; the plugin's executor
  is now a bounded thread pool (was an unbounded cached pool).

## 1.0.2

* Fixed trending extractor — resilient fallback when YouTube changes tab names
* Fixed `subtitlesStreams` typo causing compilation failure (now `subtitlesDefault`)
* Removed explicit Kotlin Gradle Plugin dependency (uses Flutter built-in Kotlin)

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
