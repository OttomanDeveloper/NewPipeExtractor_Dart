import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';

/// Controls the language and country for content extraction.
class LocalizationExtractor {
  static final _api = LocalizationApi();

  /// Sets the content language and country for all subsequent extraction requests.
  /// Example: `setLocalization('de', 'DE')` for German content.
  static Future<void> setLocalization(String languageCode, String countryCode) =>
      _api.setLocalization(languageCode, countryCode);
}
