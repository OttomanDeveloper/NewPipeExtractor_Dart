# newpipeextractor_dart

A Flutter plugin that wraps the [NewPipe Extractor](https://github.com/TeamNewPipe/NewPipeExtractor) library (v0.26.2) for extracting media data from YouTube, SoundCloud, Bandcamp, PeerTube, and media.ccc.de on Android — no API key required.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [API Reference](#api-reference)
  - [VideoExtractor](#videoextractor)
  - [SearchExtractor](#searchextractor)
  - [ChannelExtractor](#channelextractor)
  - [PlaylistExtractor](#playlistextractor)
  - [CommentsExtractor](#commentsextractor)
  - [TrendingExtractor](#trendingextractor)
  - [UrlExtractor](#urlextractor)
  - [CookieExtractor](#cookieextractor)
  - [LocalizationExtractor](#localizationextractor)
  - [ServiceExtractor](#serviceextractor-multi-service)
- [Models](#models)
  - [YoutubeVideo](#youtubevideo)
  - [VideoInfo](#videoinfo)
  - [StreamInfoItem](#streaminfoitem)
  - [YoutubeChannel](#youtubechannel)
  - [YoutubePlaylist](#youtubeplaylist)
  - [YoutubeComment](#youtubecomment)
  - [SearchResult](#searchresult)
  - [CommentsPage](#commentspage)
  - [Stream Models](#stream-models)
  - [Other Models](#other-models)
- [Enums](#enums)
- [Exceptions](#exceptions)
- [Extension Methods](#extension-methods)
- [Utilities](#utilities)
  - [reCAPTCHA Handling](#recaptcha-handling)
  - [ExtractorHttpClient](#extractorhttpclient)
- [Limitations](#limitations)
- [License](#license)

## Requirements

| Requirement | Version |
|---|---|
| Flutter | 3.10+ |
| Dart SDK | >=3.0.0 <4.0.0 |
| Android minSdk | 22 (Android 5.1+) |
| Android compileSdk | 35 |

**Android-only.** This plugin uses native Java/Kotlin code via the NewPipe Extractor library. It does not support iOS, web, macOS, Windows, or Linux.

**Dependencies bundled automatically:**
- [NewPipe Extractor](https://github.com/TeamNewPipe/NewPipeExtractor) v0.26.2
- OkHttp 4.12.0
- [flutter_inappwebview](https://pub.dev/packages/flutter_inappwebview) ^6.1.5 (for reCAPTCHA solving)

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  newpipeextractor_dart:
    git:
      url: https://github.com/OttomanDeveloper/NewPipeExtractor_Dart.git
```

Then run:

```bash
flutter pub get
```

Import in your Dart code:

```dart
import 'package:newpipeextractor_dart/newpipeextractor_dart.dart';
```

## Quick Start

```dart
import 'package:newpipeextractor_dart/newpipeextractor_dart.dart';

// Search YouTube
final results = await SearchExtractor.searchYoutube(
  'flutter tutorial',
  [SearchFilter.videos.value],
);
for (final video in results.videos) {
  print('${video.name} — ${video.uploaderName}');
}

// Get full video info + streams
final video = await VideoExtractor.getStream(
  'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
);
print('Title: ${video.videoInfo.name}');
print('Audio streams: ${video.audioOnlyStreams.length}');
print('Subtitles: ${video.subtitleStreams.length}');

// Best quality helpers
final bestAudio = video.audioWithHighestQuality;
final bestVideo = video.videoOnlyWithHighestQuality;

// Search suggestions (autocomplete)
final suggestions = await SearchExtractor.getSearchSuggestions('flutter');

// SoundCloud search (multi-service)
final scResults = await ServiceExtractor.search(
  ServiceId.soundCloud.value, 'lofi beats', [],
);

// Change content localization
await LocalizationExtractor.setLocalization('de', 'DE');
```

---

## API Reference

All extractors use static methods. Every method that calls the native layer returns a `Future`.

### VideoExtractor

Extracts video information and media streams from YouTube URLs.

| Method | Returns | Description |
|---|---|---|
| `getStream(String url)` | `Future<YoutubeVideo>` | Full video info + all streams (audio, video, muxed, subtitles, segments, framesets) |
| `getVideoInfo(String url)` | `Future<VideoInfo>` | Video metadata only, no streams |
| `getVideoSegments(String url)` | `Future<List<StreamSegment>>` | Video chapters/segments |
| `getRelatedStreams(String url)` | `Future<SearchResult>` | Related videos, playlists, and channels |

```dart
final video = await VideoExtractor.getStream(url);
print(video.videoInfo.streamType); // StreamType.videoStream, liveStream, etc.
print(video.videoInfo.hlsUrl);     // HLS manifest URL for live streams
print(video.videoInfo.isShort);    // true if YouTube Short
```

### SearchExtractor

YouTube and YouTube Music search with pagination and autocomplete.

| Method | Returns | Description |
|---|---|---|
| `searchYoutube(String query, List<String> filters)` | `Future<SearchResult>` | Search YouTube — returns videos, playlists, channels |
| `getNextPage()` | `Future<SearchResult>` | Next page of YouTube search results |
| `searchYoutubeMusic(String query, List<String> filters)` | `Future<SearchResult>` | Search YouTube Music |
| `getNextMusicPage()` | `Future<SearchResult>` | Next page of YouTube Music results |
| `getSearchSuggestions(String query)` | `Future<List<String>>` | Autocomplete suggestions |

```dart
// Use SearchFilter enum for type-safe filters
final results = await SearchExtractor.searchYoutube(
  'dart programming',
  [SearchFilter.videos.value],
);

// Paginate
final page2 = await SearchExtractor.getNextPage();

// Autocomplete
final suggestions = await SearchExtractor.getSearchSuggestions('flu');
// ['flutter', 'fluffy', 'flu symptoms', ...]
```

### ChannelExtractor

YouTube channel info, uploads, and tab-based browsing (Videos, Shorts, Live, Playlists).

| Method | Returns | Description |
|---|---|---|
| `getChannelInfo(String url)` | `Future<YoutubeChannel>` | Channel metadata with available tabs |
| `getChannelUploads(String url)` | `Future<List<StreamInfoItem>>` | Channel uploads via feed |
| `getChannelNextPage()` | `Future<List<StreamInfoItem>>` | Next page of channel uploads |
| `getChannelTabContent(String url, String tabFilter)` | `Future<({List<StreamInfoItem> items, bool hasNextPage})>` | Content from a specific channel tab |
| `getChannelTabNextPage()` | `Future<({List<StreamInfoItem> items, bool hasNextPage})>` | Next page of tab content |

```dart
final channel = await ChannelExtractor.getChannelInfo(url);
print(channel.name);
print(channel.isVerified);
print(channel.tabs); // [ChannelTab.videos, ChannelTab.shorts, ChannelTab.live, ...]

// Browse Shorts tab
final shorts = await ChannelExtractor.getChannelTabContent(
  url, 'shorts',
);
for (final item in shorts.items) {
  print('${item.name} (${item.isShort})');
}
if (shorts.hasNextPage) {
  final more = await ChannelExtractor.getChannelTabNextPage();
}
```

### PlaylistExtractor

YouTube playlist details and paginated stream listing.

| Method | Returns | Description |
|---|---|---|
| `getPlaylistDetails(String url)` | `Future<YoutubePlaylist>` | Playlist metadata |
| `getPlaylistStreams(String url)` | `Future<List<StreamInfoItem>>` | Videos in the playlist |
| `getPlaylistNextPage()` | `Future<List<StreamInfoItem>>` | Next page of playlist videos |

```dart
final playlist = await PlaylistExtractor.getPlaylistDetails(url);
print('${playlist.name} — ${playlist.streamCount} videos');
print('Type: ${playlist.playlistType}'); // PlaylistType.normal, mixStream, etc.

final streams = await PlaylistExtractor.getPlaylistStreams(url);
final more = await PlaylistExtractor.getPlaylistNextPage();
```

### CommentsExtractor

YouTube comments with pagination and reply threads.

| Method | Returns | Description |
|---|---|---|
| `getComments(String url)` | `Future<CommentsPage>` | First page of comments |
| `getNextCommentsPage()` | `Future<CommentsPage>` | Next page of comments |
| `getCommentReplies(int commentIndex)` | `Future<CommentsPage>` | Replies to a specific comment (by index from the last fetched page) |

```dart
final page = await CommentsExtractor.getComments(videoUrl);
for (final comment in page.comments) {
  print('${comment.author}: ${comment.commentText}');
  print('  Likes: ${comment.likeCount}, Replies: ${comment.replyCount}');
  print('  Pinned: ${comment.pinned}, Hearted: ${comment.hearted}');
  print('  Channel owner: ${comment.isChannelOwner}');
}

// Load more comments
if (page.hasNextPage) {
  final page2 = await CommentsExtractor.getNextCommentsPage();
}

// Load replies to the first comment
if (page.comments.first.replyCount > 0) {
  final replies = await CommentsExtractor.getCommentReplies(0);
}
```

### TrendingExtractor

YouTube trending/kiosk content.

| Method | Returns | Description |
|---|---|---|
| `getTrendingVideos()` | `Future<List<StreamInfoItem>>` | Trending videos (default locale) |
| `listKiosks()` | `Future<List<String>>` | Available kiosk IDs (e.g., "Trending", "Top 50") |
| `getKioskContent(String kioskId)` | `Future<List<StreamInfoItem>>` | Content from a specific kiosk |

```dart
final trending = await TrendingExtractor.getTrendingVideos();

// Discover available kiosks
final kiosks = await TrendingExtractor.listKiosks();
// ['Trending', 'Top 50', 'New & Hot', ...]

final top50 = await TrendingExtractor.getKioskContent('Top 50');
```

### UrlExtractor

URL parsing and validation.

| Method | Returns | Description |
|---|---|---|
| `getIdFromStreamUrl(String url)` | `Future<String?>` | Extract video ID from URL |
| `getIdFromPlaylistUrl(String url)` | `Future<String?>` | Extract playlist ID from URL |
| `getIdFromChannelUrl(String url)` | `Future<String?>` | Extract channel ID from URL |
| `isValidStreamUrl(String url)` | `Future<bool>` | Check if URL is a valid video URL |
| `isValidPlaylistUrl(String url)` | `Future<bool>` | Check if URL is a valid playlist URL |
| `isValidChannelUrl(String url)` | `Future<bool>` | Check if URL is a valid channel URL |

```dart
final id = await UrlExtractor.getIdFromStreamUrl(
  'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
); // 'dQw4w9WgXcQ'

final valid = await UrlExtractor.isValidStreamUrl(someUrl);
```

### CookieExtractor

Manage cookies for the HTTP client (used for reCAPTCHA persistence).

| Method | Returns | Description |
|---|---|---|
| `setCookie(String cookie)` | `Future<void>` | Set cookie on the native HTTP client (persisted to SharedPreferences) |
| `getCookieByUrl(String url)` | `Future<String?>` | Get cookie string for a URL |
| `decodeCookie(String cookie)` | `Future<String?>` | URL-decode a cookie string |

### LocalizationExtractor

Control the language and country for content extraction.

| Method | Returns | Description |
|---|---|---|
| `setLocalization(String languageCode, String countryCode)` | `Future<void>` | Set content language and country (affects all subsequent requests) |

```dart
// Get German content
await LocalizationExtractor.setLocalization('de', 'DE');

// Get Japanese trending
await LocalizationExtractor.setLocalization('ja', 'JP');
final trending = await TrendingExtractor.getTrendingVideos();
```

### ServiceExtractor (Multi-Service)

Generic extractor that works across all 5 supported services. Use `ServiceId` enum or raw service IDs.

| Service | ID | Supported Features |
|---|---|---|
| YouTube | 0 | Streams, search, channels, playlists, kiosks, suggestions |
| SoundCloud | 1 | Streams, search, channels, playlists, kiosks, suggestions |
| media.ccc.de | 2 | Streams, search, channels, playlists, kiosks |
| PeerTube | 3 | Streams, search, channels, playlists, kiosks |
| Bandcamp | 4 | Streams, search, channels, playlists, kiosks |

| Method | Returns | Description |
|---|---|---|
| `getAvailableServices()` | `Future<List<ServiceInfo>>` | List all supported services |
| `getStreamInfo(int serviceId, String url)` | `Future<VideoInfo>` | Stream metadata for any service |
| `getStream(int serviceId, String url)` | `Future<YoutubeVideo>` | Full stream info + all media streams |
| `getRelatedItems(int serviceId, String url)` | `Future<SearchResult>` | Related content |
| `search(int serviceId, String query, List<String> filters)` | `Future<SearchResult>` | Search any service |
| `searchNextPage(int serviceId)` | `Future<SearchResult>` | Next search results page |
| `getSuggestions(int serviceId, String query)` | `Future<List<String>>` | Search autocomplete |
| `getChannelInfo(int serviceId, String url)` | `Future<YoutubeChannel>` | Channel/artist info |
| `getChannelContent(int serviceId, String url)` | `Future<List<StreamInfoItem>>` | Channel content |
| `getChannelContentNextPage(int serviceId)` | `Future<List<StreamInfoItem>>` | Next page of channel content |
| `getPlaylistInfo(int serviceId, String url)` | `Future<YoutubePlaylist>` | Playlist/album info |
| `getPlaylistContent(int serviceId, String url)` | `Future<List<StreamInfoItem>>` | Playlist tracks |
| `getPlaylistContentNextPage(int serviceId)` | `Future<List<StreamInfoItem>>` | Next page of playlist tracks |
| `listKiosks(int serviceId)` | `Future<List<String>>` | Available kiosks for a service |
| `getKioskContent(int serviceId, String kioskId)` | `Future<List<StreamInfoItem>>` | Kiosk content (charts, trending, etc.) |

```dart
// Discover services
final services = await ServiceExtractor.getAvailableServices();
for (final s in services) {
  print('${s.name} (id: ${s.serviceId})');
}

// Search SoundCloud
final results = await ServiceExtractor.search(
  ServiceId.soundCloud.value, 'lofi beats', [],
);

// Get Bandcamp album
final album = await ServiceExtractor.getPlaylistInfo(
  ServiceId.bandcamp.value, bandcampAlbumUrl,
);
final tracks = await ServiceExtractor.getPlaylistContent(
  ServiceId.bandcamp.value, bandcampAlbumUrl,
);

// Browse PeerTube kiosks
final kiosks = await ServiceExtractor.listKiosks(ServiceId.peerTube.value);
final content = await ServiceExtractor.getKioskContent(
  ServiceId.peerTube.value, kiosks.first,
);
```

---

## Models

All models are immutable (`@freezed`), have `copyWith`, `==`, `hashCode`, `toJson/fromJson`.

### YoutubeVideo

Complete video with all streams and metadata.

| Field | Type | Default |
|---|---|---|
| `videoInfo` | `VideoInfo` | required |
| `audioOnlyStreams` | `List<AudioOnlyStream>` | `[]` |
| `videoOnlyStreams` | `List<VideoOnlyStream>` | `[]` |
| `videoStreams` | `List<VideoStream>` | `[]` |
| `subtitleStreams` | `List<SubtitleStream>` | `[]` |
| `segments` | `List<StreamSegment>` | `[]` |
| `framesets` | `List<Frameset>` | `[]` |

### VideoInfo

Full video metadata (28 fields).

| Field | Type | Description |
|---|---|---|
| `id` | `String?` | Video ID (e.g., `dQw4w9WgXcQ`) |
| `url` | `String?` | Full video URL |
| `name` | `String?` | Video title |
| `uploaderName` | `String?` | Channel name |
| `uploaderUrl` | `String?` | Channel URL |
| `uploaderAvatars` | `List<String>` | Channel avatar image URLs |
| `uploadDate` | `String?` | Textual upload date |
| `description` | `String?` | Video description |
| `length` | `int?` | Duration in seconds |
| `viewCount` | `int?` | View count |
| `likeCount` | `int?` | Like count |
| `dislikeCount` | `int?` | Dislike count |
| `category` | `String?` | Video category |
| `ageLimit` | `int?` | Age restriction |
| `tags` | `List<String>` | Video tags |
| `thumbnails` | `List<String>` | Thumbnail URLs (multiple resolutions) |
| `streamType` | `StreamType` | Video type (video, live, audio, etc.) |
| `hlsUrl` | `String?` | HLS manifest URL (live streams) |
| `dashMpdUrl` | `String?` | DASH manifest URL |
| `isShort` | `bool` | Whether this is a YouTube Short |
| `isUploaderVerified` | `bool` | Verified badge on uploader |
| `privacy` | `Privacy` | Privacy status |
| `uploaderSubscriberCount` | `int?` | Uploader's subscriber count |
| `subChannelName` | `String?` | Sub-channel/topic name |
| `subChannelUrl` | `String?` | Sub-channel URL |
| `subChannelAvatars` | `List<String>` | Sub-channel avatars |
| `licence` | `String?` | Content licence |
| `supportInfo` | `String?` | Creator support/donation info |

### StreamInfoItem

Lightweight video item used in lists (search results, playlists, trending, etc.).

| Field | Type | Description |
|---|---|---|
| `url` | `String?` | Video URL |
| `id` | `String?` | Video ID |
| `name` | `String?` | Video title |
| `uploaderName` | `String?` | Channel name |
| `uploaderUrl` | `String?` | Channel URL |
| `uploaderAvatars` | `List<String>` | Channel avatars |
| `uploadDate` | `String?` | Textual upload date |
| `date` | `String?` | ISO date string |
| `duration` | `int?` | Duration in seconds |
| `viewCount` | `int?` | View count |
| `isShort` | `bool` | YouTube Short flag |
| `thumbnails` | `List<String>` | Thumbnail URLs |

### YoutubeChannel

| Field | Type | Description |
|---|---|---|
| `id` | `String?` | Channel ID |
| `name` | `String?` | Channel name |
| `url` | `String?` | Channel URL |
| `avatars` | `List<String>` | Avatar URLs |
| `banners` | `List<String>` | Banner URLs |
| `description` | `String?` | Channel description |
| `feedUrl` | `String?` | RSS feed URL |
| `subscriberCount` | `int?` | Subscriber count |
| `isVerified` | `bool` | Verified badge |
| `tabs` | `List<ChannelTab>` | Available tabs (Videos, Shorts, Live, etc.) |

### YoutubePlaylist

| Field | Type | Description |
|---|---|---|
| `id` | `String?` | Playlist ID |
| `name` | `String?` | Playlist name |
| `url` | `String?` | Playlist URL |
| `uploaderName` | `String?` | Creator name |
| `uploaderAvatars` | `List<String>` | Creator avatars |
| `uploaderUrl` | `String?` | Creator channel URL |
| `banners` | `List<String>` | Playlist banner URLs |
| `thumbnails` | `List<String>` | Playlist thumbnails |
| `streamCount` | `int` | Number of videos |
| `description` | `String?` | Playlist description |
| `playlistType` | `PlaylistType` | Type (normal, mix, album) |

### YoutubeComment

| Field | Type | Description |
|---|---|---|
| `author` | `String?` | Comment author |
| `commentText` | `String?` | Comment text |
| `uploadDate` | `String?` | When posted |
| `uploaderAvatars` | `List<String>` | Author's avatars |
| `uploaderUrl` | `String?` | Author's channel URL |
| `commentId` | `String?` | Comment ID |
| `likeCount` | `int?` | Like count |
| `hearted` | `bool` | Hearted by video creator |
| `pinned` | `bool` | Pinned by video creator |
| `replyCount` | `int` | Number of replies |
| `isChannelOwner` | `bool` | Author is the video uploader |
| `isUploaderVerified` | `bool` | Author has verified badge |
| `streamPosition` | `int?` | Timestamp reference in video |

### SearchResult

| Field | Type |
|---|---|
| `videos` | `List<StreamInfoItem>` |
| `playlists` | `List<PlaylistInfoItem>` |
| `channels` | `List<ChannelInfoItem>` |

### CommentsPage

| Field | Type |
|---|---|
| `comments` | `List<YoutubeComment>` |
| `hasNextPage` | `bool` |

### Stream Models

**AudioOnlyStream** — Audio track with bitrate and track metadata.

| Field | Type | Description |
|---|---|---|
| `url` | `String?` | Stream URL |
| `averageBitrate` | `int` | Bitrate in kbps |
| `formatName` | `String?` | Format name (e.g., `m4a`, `webm`) |
| `formatSuffix` | `String?` | File extension |
| `formatMimeType` | `String?` | MIME type |
| `audioTrackName` | `String?` | Track name (for multi-audio videos) |
| `audioTrackLocale` | `String?` | Language code of audio track |
| `audioTrackType` | `String?` | Track type (ORIGINAL, DUBBED, DESCRIPTIVE) |

**VideoOnlyStream** — Video track (no audio).

| Field | Type | Description |
|---|---|---|
| `url` | `String?` | Stream URL |
| `resolution` | `String?` | Resolution (e.g., `1080p`, `720p60`) |
| `fps` | `int` | Frames per second |
| `formatName` | `String?` | Format name |
| `formatSuffix` | `String?` | File extension |
| `formatMimeType` | `String?` | MIME type |

**VideoStream** — Muxed video + audio stream. Same fields as VideoOnlyStream.

**SubtitleStream** — Subtitle/caption track.

| Field | Type | Description |
|---|---|---|
| `url` | `String?` | Subtitle file URL |
| `format` | `String?` | Format (VTT, TTML, SRT, etc.) |
| `languageCode` | `String?` | Language code (e.g., `en`, `es`) |
| `isAutoGenerated` | `bool` | Whether auto-generated by YouTube |

### Other Models

**StreamSegment** — Video chapter/segment.

| Field | Type |
|---|---|
| `url` | `String?` |
| `title` | `String?` |
| `previewUrl` | `String?` |
| `startTimeSeconds` | `int` |

**Frameset** — Storyboard/preview thumbnail grid.

| Field | Type |
|---|---|
| `urls` | `List<String>` |
| `width` | `int` |
| `height` | `int` |
| `totalCount` | `int` |

**ChannelInfoItem** — Lightweight channel in search results.

| Field | Type |
|---|---|
| `url`, `name`, `description` | `String?` |
| `thumbnails` | `List<String>` |
| `subscriberCount` | `int?` |
| `streamCount` | `int` |
| `isVerified` | `bool` |

**PlaylistInfoItem** — Lightweight playlist in search results.

| Field | Type |
|---|---|
| `url`, `name`, `uploaderName` | `String?` |
| `thumbnails` | `List<String>` |
| `streamCount` | `int` |

**ServiceInfo** — Describes an available extraction service.

| Field | Type |
|---|---|
| `serviceId` | `int` (required) |
| `name` | `String` (required) |
| `baseUrl` | `String?` |

---

## Enums

### StreamType
Identifies the type of media stream.

| Value | Description |
|---|---|
| `videoStream` | Standard video |
| `audioStream` | Audio-only content |
| `liveStream` | Live video stream |
| `audioLiveStream` | Live audio stream |
| `postLiveStream` | Ended live stream (VOD) |
| `none` | Unknown/default |

### PlaylistType

| Value | Description |
|---|---|
| `normal` | Regular playlist |
| `mixStream` | Auto-generated mix from a video |
| `mixChannel` | Auto-generated mix from a channel |
| `mixAlbum` | Album mix |

### Privacy

| Value | Description |
|---|---|
| `public_` | Public |
| `unlisted` | Unlisted |
| `private_` | Private |
| `internal_` | Internal |
| `other` | Unknown |

### ChannelTab

| Value | Tab name |
|---|---|
| `videos` | Videos |
| `shorts` | Shorts |
| `live` | Live streams |
| `playlists` | Playlists |
| `channels` | Featured channels |
| `albums` | Albums/podcasts |

### SearchFilter

| Value | Filter string |
|---|---|
| `all` | `'all'` |
| `videos` | `'videos'` |
| `channels` | `'channels'` |
| `playlists` | `'playlists'` |
| `musicSongs` | `'music_songs'` |
| `musicVideos` | `'music_videos'` |
| `musicAlbums` | `'music_albums'` |
| `musicPlaylists` | `'music_playlists'` |
| `musicArtists` | `'music_artists'` |

### ServiceId

| Value | ID |
|---|---|
| `youtube` | 0 |
| `soundCloud` | 1 |
| `mediaCccDe` | 2 |
| `peerTube` | 3 |
| `bandcamp` | 4 |

---

## Exceptions

All exceptions extend the `sealed class ExtractorException`:

```dart
try {
  final video = await VideoExtractor.getStream(url);
} on ExtractorException catch (e) {
  switch (e) {
    case BadUrlException():
      print('Invalid URL: ${e.message}');
    case FatalFailureException():
      print('YouTube changed something: ${e.message}');
    case TransientFailureException():
      print('Temporary error, try again: ${e.message}');
    case RequestLimitExceededException():
      print('Rate limited: ${e.message}');
    case ReCaptchaRequiredException():
      print('CAPTCHA needed at: ${e.challengeUrl}');
    case StreamIsNullException():
      print('No stream available: ${e.message}');
  }
}
```

| Exception | When it's thrown |
|---|---|
| `BadUrlException` | URL is null, empty, or malformed |
| `StreamIsNullException` | Attempted to access a stream that wasn't loaded |
| `FatalFailureException` | HTTP 4xx error (likely a YouTube API change) |
| `TransientFailureException` | HTTP 5xx error (YouTube-side issue, retry later) |
| `RequestLimitExceededException` | HTTP 429 or Google rate-limiting redirect |
| `ReCaptchaRequiredException` | YouTube requires CAPTCHA verification (has `challengeUrl` field) |

---

## Extension Methods

`YoutubeVideoHelpers` on `YoutubeVideo` — convenience getters for selecting the best stream:

| Method | Returns | Description |
|---|---|---|
| `videoOnlyWithHighestQuality` | `VideoOnlyStream?` | Highest resolution video-only stream |
| `videoWithHighestQuality` | `VideoStream?` | Highest resolution muxed stream |
| `audioWithHighestQuality` | `AudioOnlyStream?` | Highest bitrate audio stream |
| `audioWithBestAacQuality` | `AudioOnlyStream?` | Best AAC (m4a) audio stream |
| `audioWithBestOggQuality` | `AudioOnlyStream?` | Best OGG (webm) audio stream |
| `bestAudioForVideo(VideoOnlyStream)` | `AudioOnlyStream?` | Best audio format matching a video stream (AAC for MP4, OGG for WebM) |

```dart
final video = await VideoExtractor.getStream(url);

// Best video + matching audio for download
final bestVideo = video.videoOnlyWithHighestQuality;
if (bestVideo != null) {
  final bestAudio = video.bestAudioForVideo(bestVideo);
  print('Video: ${bestVideo.resolution} ${bestVideo.formatSuffix}');
  print('Audio: ${bestAudio?.averageBitrate}kbps ${bestAudio?.formatSuffix}');
}
```

---

## Utilities

### reCAPTCHA Handling

YouTube may require CAPTCHA verification when detecting automated requests. This plugin handles it via an in-app WebView.

**Setup** (call once at app startup):

```dart
setReCaptchaNavigator((String challengeUrl) async {
  // Navigate to the ReCaptchaPage widget
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => const ReCaptchaPage(),
      settings: RouteSettings(arguments: challengeUrl),
    ),
  );
});
```

The `ReCaptchaPage` widget displays a WebView with the CAPTCHA challenge. Once the user solves it, cookies are automatically saved to the native HTTP client and persisted across app restarts.

All extractor methods automatically retry after a successful CAPTCHA solve.

### ExtractorHttpClient

Low-level HTTP utility for stream downloading.

| Member | Description |
|---|---|
| `defaultHeaders` | Default User-Agent headers |
| `getContentLength(String url)` | Get the byte size of a stream URL |
| `getStream(dynamic stream, {...})` | Download a stream as chunks with automatic retry on failure |

---

## Limitations

### Platform
- **Android-only.** The plugin depends on the NewPipe Extractor Java library running on the JVM. iOS, web, and desktop are not supported.
- **minSdk 22** (Android 5.1). Devices below this cannot use the plugin.

### YouTube
- **No official API.** This plugin reverse-engineers YouTube's internal API via NewPipe Extractor. YouTube can and does change their API without notice, which may break extraction until the NewPipe Extractor library is updated.
- **Rate limiting.** YouTube throttles automated requests. Heavy usage will trigger reCAPTCHA challenges or HTTP 429 errors.
- **Age-restricted content** may fail to extract depending on YouTube's current verification requirements.
- **Members-only / premium content** is flagged but cannot be extracted without authentication.
- **Muxed streams capped at 720p.** Higher resolutions are only available as separate video-only + audio-only streams that must be muxed client-side.
- **Comment replies** use index-based lookup from the last fetched page — calling `getCommentReplies(index)` only works with indices from the most recently returned comment page.
- **Pagination is stateful.** Search, comments, channel uploads, and playlist streams store pagination state on the native side. Calling `getNextPage()` returns the next page of the most recent query. Interleaving different queries will lose pagination state.

### Multi-Service (SoundCloud, Bandcamp, PeerTube, media.ccc.de)
- **Feature coverage varies by service.** Not all services support all features (e.g., some may not have search suggestions or kiosks).
- **Channel content pagination** for non-YouTube services may be limited depending on the service's feed support.
- **Service-specific features** (e.g., SoundCloud likes, Bandcamp radio) are not exposed — only the generic extraction interface (search, streams, channels, playlists, kiosks) is available.
- **PeerTube instances** require the instance URL in the content URL — there is no instance discovery mechanism.
- **No authentication.** Private or premium content on any service cannot be accessed.

### General
- **No background extraction.** All extraction runs on a single background thread. Concurrent calls from multiple isolates will queue sequentially.
- **Network dependent.** All extraction requires an active internet connection. There is no offline caching.
- **No download manager.** The plugin provides stream URLs but does not handle downloading, muxing, or file management.
- **Stream URLs expire.** Media stream URLs returned by extractors are temporary and will expire (typically within hours). Do not persist them — re-extract when needed.

---

## Author

**Muhammad Usman** — [GitHub](https://github.com/OttomanDeveloper)

## License

MIT License — see [LICENSE](LICENSE) for details.
