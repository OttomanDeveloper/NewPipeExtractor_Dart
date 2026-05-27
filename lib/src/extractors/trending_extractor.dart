import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class TrendingExtractor {
  static final _api = TrendingApi();

  static Future<List<StreamInfoItemDto?>> getTrendingVideos() =>
      withReCaptchaRetry(() => _api.getTrendingVideos());
}
