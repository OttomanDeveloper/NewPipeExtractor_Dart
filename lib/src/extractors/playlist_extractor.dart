import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class PlaylistExtractor {
  static final _api = PlaylistApi();

  static Future<PlaylistDto> getPlaylistDetails(String url) =>
      withReCaptchaRetry(() => _api.getPlaylistDetails(url));

  static Future<List<StreamInfoItemDto?>> getPlaylistStreams(String url) =>
      withReCaptchaRetry(() => _api.getPlaylistStreams(url));

  static Future<List<StreamInfoItemDto?>> getPlaylistNextPage() =>
      withReCaptchaRetry(() => _api.getPlaylistNextPage());
}
