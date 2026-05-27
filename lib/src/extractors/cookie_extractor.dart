import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';

class CookieExtractor {
  static final _api = CookieApi();

  static Future<void> setCookie(String cookie) => _api.setCookie(cookie);
  static Future<String?> getCookieByUrl(String url) => _api.getCookieByUrl(url);
  static Future<String?> decodeCookie(String cookie) => _api.decodeCookie(cookie);
}
