import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/youtube_video.dart';
import 'package:newpipeextractor_dart/src/models/video_info.dart';
import 'package:newpipeextractor_dart/src/models/search_result.dart';
import 'package:newpipeextractor_dart/src/models/stream_segment.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class VideoExtractor {
  static final _api = VideoExtractorApi();

  static Future<YoutubeVideo> getStream(String url) async {
    final info = await withReCaptchaRetry(() => _api.getVideoInfo(url));
    final streams = await withReCaptchaRetry(() => _api.getVideoStreams(url));
    return m.mapYoutubeVideo(info, streams);
  }

  static Future<VideoInfo> getVideoInfo(String url) async {
    final dto = await withReCaptchaRetry(() => _api.getVideoInfo(url));
    return m.mapVideoInfo(dto);
  }

  static Future<List<StreamSegment>> getVideoSegments(String url) async {
    final dtos = await withReCaptchaRetry(() => _api.getVideoSegments(url));
    return dtos.whereType<SegmentDto>().map(m.mapSegment).toList();
  }

  static Future<SearchResult> getRelatedStreams(String url) async {
    final dto = await withReCaptchaRetry(() => _api.getRelatedStreams(url));
    return m.mapSearchResult(dto);
  }
}
