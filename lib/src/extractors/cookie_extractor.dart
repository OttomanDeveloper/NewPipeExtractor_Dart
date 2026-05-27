import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';

/// Manages cookies for the native HTTP client used by NewPipe Extractor.
class CookieExtractor {
  static final _api = CookieApi();

  /// Sets a cookie on the native HTTP client. Persisted across app restarts.
  static Future<void> setCookie(String cookie) => _api.setCookie(cookie);

  /// Returns the cookie string for a URL from the system CookieManager.
  static Future<String?> getCookieByUrl(String url) => _api.getCookieByUrl(url);

  /// URL-decodes a cookie string.
  static Future<String?> decodeCookie(String cookie) => _api.decodeCookie(cookie);
}
