// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_only_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoOnlyStreamImpl _$$VideoOnlyStreamImplFromJson(
        Map<String, dynamic> json) =>
    _$VideoOnlyStreamImpl(
      url: json['url'] as String?,
      resolution: json['resolution'] as String?,
      fps: (json['fps'] as num?)?.toInt() ?? 0,
      formatName: json['formatName'] as String?,
      formatSuffix: json['formatSuffix'] as String?,
      formatMimeType: json['formatMimeType'] as String?,
    );

Map<String, dynamic> _$$VideoOnlyStreamImplToJson(
        _$VideoOnlyStreamImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'resolution': instance.resolution,
      'fps': instance.fps,
      'formatName': instance.formatName,
      'formatSuffix': instance.formatSuffix,
      'formatMimeType': instance.formatMimeType,
    };
