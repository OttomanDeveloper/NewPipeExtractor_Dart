import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';

class UrlExtractor {
  static final _api = UrlApi();

  static Future<String?> getIdFromStreamUrl(String url) => _api.getIdFromStreamUrl(url);
  static Future<String?> getIdFromPlaylistUrl(String url) => _api.getIdFromPlaylistUrl(url);
  static Future<String?> getIdFromChannelUrl(String url) => _api.getIdFromChannelUrl(url);
}
