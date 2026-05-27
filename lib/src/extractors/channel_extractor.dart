import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class ChannelExtractor {
  static final _api = ChannelApi();

  static Future<ChannelDto> getChannelInfo(String url) =>
      withReCaptchaRetry(() => _api.getChannelInfo(url));

  static Future<List<StreamInfoItemDto?>> getChannelUploads(String url) =>
      withReCaptchaRetry(() => _api.getChannelUploads(url));

  static Future<List<StreamInfoItemDto?>> getChannelNextPage() =>
      withReCaptchaRetry(() => _api.getChannelNextPage());

  static Future<TabPageDto> getChannelTabContent(String url, String tabFilter) =>
      withReCaptchaRetry(() => _api.getChannelTabContent(url, tabFilter));

  static Future<TabPageDto> getChannelTabNextPage() =>
      withReCaptchaRetry(() => _api.getChannelTabNextPage());
}
