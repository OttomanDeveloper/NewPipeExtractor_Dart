import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';

class UrlExtractor {
  static final _api = UrlApi();

  static Future<String?> getIdFromStreamUrl(String url) => _api.getIdFromStreamUrl(url);
  static Future<String?> getIdFromPlaylistUrl(String url) => _api.getIdFromPlaylistUrl(url);
  static Future<String?> getIdFromChannelUrl(String url) => _api.getIdFromChannelUrl(url);

  static Future<bool> isValidStreamUrl(String url) => _api.isValidStreamUrl(url);
  static Future<bool> isValidPlaylistUrl(String url) => _api.isValidPlaylistUrl(url);
  static Future<bool> isValidChannelUrl(String url) => _api.isValidChannelUrl(url);
}
