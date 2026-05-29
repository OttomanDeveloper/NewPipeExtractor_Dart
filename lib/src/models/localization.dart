import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization.freezed.dart';
part 'localization.g.dart';

/// A language/country pair a service supports for content extraction
/// (e.g. `languageCode: 'en'`, `countryCode: 'GB'`, `localizationCode: 'en-GB'`).
@freezed
class Localization with _$Localization {
  const factory Localization({
    required String languageCode,
    required String countryCode,
    required String localizationCode,
  }) = _Localization;

  factory Localization.fromJson(Map<String, dynamic> json) =>
      _$LocalizationFromJson(json);
}

/// A country a service supports for region-specific content (ISO 3166-1 alpha-2).
@freezed
class ContentCountry with _$ContentCountry {
  const factory ContentCountry({
    required String countryCode,
  }) = _ContentCountry;

  factory ContentCountry.fromJson(Map<String, dynamic> json) =>
      _$ContentCountryFromJson(json);
}
