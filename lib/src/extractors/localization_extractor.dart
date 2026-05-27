import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';

class LocalizationExtractor {
  static final _api = LocalizationApi();

  static Future<void> setLocalization(String languageCode, String countryCode) =>
      _api.setLocalization(languageCode, countryCode);
}
