import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class VideoExtractor {
  static final _api = VideoExtractorApi();

  static Future<VideoInfoDto> getVideoInfo(String url) =>
      withReCaptchaRetry(() => _api.getVideoInfo(url));

  static Future<StreamsDto> getVideoStreams(String url) =>
      withReCaptchaRetry(() => _api.getVideoStreams(url));

  static Future<List<SegmentDto?>> getVideoSegments(String url) =>
      withReCaptchaRetry(() => _api.getVideoSegments(url));

  static Future<SearchResultDto> getRelatedStreams(String url) =>
      withReCaptchaRetry(() => _api.getRelatedStreams(url));
}
