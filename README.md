# newpipeextractor_dart

A Flutter plugin that wraps the [NewPipe Extractor](https://github.com/TeamNewPipe/NewPipeExtractor) library for YouTube data extraction on Android — no API key required.

## Features

- Video info, streams (audio/video/muxed), subtitles, chapters
- YouTube & YouTube Music search with pagination
- Search suggestions (autocomplete)
- Channel info with tab browsing (Videos, Shorts, Live, Playlists)
- Playlist details with paginated streams
- Comments with pagination
- Trending videos
- Live stream support (HLS/DASH)
- reCAPTCHA challenge handling

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  newpipeextractor_dart:
    git:
      url: https://github.com/OttomanDeveloper/NewPipeExtractor_Dart.git
```

## Usage

```dart
import 'package:newpipeextractor_dart/newpipeextractor_dart.dart';

// Search YouTube
final results = await SearchExtractor.searchYoutube('flutter', [SearchFilter.videos]);

// Get video info and streams
final video = await VideoExtractor.getStream('https://youtube.com/watch?v=...');

// Get search suggestions
final suggestions = await SearchExtractor.getSearchSuggestions('flutter');
```

## Platform Support

| Android |
|:-------:|
|    ✅    |

## Author

**Muhammad Usman** — [GitHub](https://github.com/OttomanDeveloper)

## License

MIT License — see [LICENSE](LICENSE) for details.
