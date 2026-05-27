import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/youtube_video.dart';
import 'package:newpipeextractor_dart/src/models/video_info.dart';
import 'package:newpipeextractor_dart/src/models/search_result.dart';
import 'package:newpipeextractor_dart/src/models/stream_segment.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

/// Extracts video information and media streams from YouTube URLs.
class VideoExtractor {
  static final _api = VideoExtractorApi();

  /// Returns complete video with all streams (audio, video, muxed, subtitles, segments, framesets).
  static Future<YoutubeVideo> getStream(String url) async {
    final info = await withReCaptchaRetry(() => _api.getVideoInfo(url));
    final streams = await withReCaptchaRetry(() => _api.getVideoStreams(url));
    return m.mapYoutubeVideo(info, streams);
  }

  /// Returns video metadata only, without streams. Faster than [getStream].
  static Future<VideoInfo> getVideoInfo(String url) async {
    final dto = await withReCaptchaRetry(() => _api.getVideoInfo(url));
    return m.mapVideoInfo(dto);
  }

  /// Returns video chapters/segments. Empty list if the video has no chapters.
  static Future<List<StreamSegment>> getVideoSegments(String url) async {
    final dtos = await withReCaptchaRetry(() => _api.getVideoSegments(url));
    return dtos.whereType<SegmentDto>().map(m.mapSegment).toList();
  }

  /// Returns related videos, playlists, and channels for a video.
  static Future<SearchResult> getRelatedStreams(String url) async {
    final dto = await withReCaptchaRetry(() => _api.getRelatedStreams(url));
    return m.mapSearchResult(dto);
  }
}
