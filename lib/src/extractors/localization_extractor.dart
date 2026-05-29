import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/localization.dart';

/// Controls the language and country for content extraction, and exposes the
/// localizations/countries each service supports.
///
/// `serviceId` defaults to `0` (YouTube). Use [ServiceExtractor.getAvailableServices]
/// to discover other service IDs.
class LocalizationExtractor {
  static final _api = LocalizationApi();

  /// Sets the content language and country for all subsequent extraction requests.
  /// Example: `setLocalization('de', 'DE')` for German content.
  static Future<void> setLocalization(String languageCode, String countryCode) =>
      _api.setLocalization(languageCode, countryCode);

  /// Returns the language/country pairs a service supports (local lookup, no network).
  static Future<List<Localization>> getSupportedLocalizations({int serviceId = 0}) async {
    final dtos = await _api.getSupportedLocalizations(serviceId);
    return dtos.whereType<LocalizationDto>().map(m.mapLocalization).toList();
  }

  /// Returns the countries a service supports for region-specific content
  /// (local lookup, no network).
  static Future<List<ContentCountry>> getSupportedCountries({int serviceId = 0}) async {
    final dtos = await _api.getSupportedCountries(serviceId);
    return dtos.whereType<ContentCountryDto>().map(m.mapContentCountry).toList();
  }
}
