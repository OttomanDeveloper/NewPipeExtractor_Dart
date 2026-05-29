// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalizationImpl _$$LocalizationImplFromJson(Map<String, dynamic> json) =>
    _$LocalizationImpl(
      languageCode: json['languageCode'] as String,
      countryCode: json['countryCode'] as String,
      localizationCode: json['localizationCode'] as String,
    );

Map<String, dynamic> _$$LocalizationImplToJson(_$LocalizationImpl instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'countryCode': instance.countryCode,
      'localizationCode': instance.localizationCode,
    };

_$ContentCountryImpl _$$ContentCountryImplFromJson(Map<String, dynamic> json) =>
    _$ContentCountryImpl(
      countryCode: json['countryCode'] as String,
    );

Map<String, dynamic> _$$ContentCountryImplToJson(
        _$ContentCountryImpl instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
    };
