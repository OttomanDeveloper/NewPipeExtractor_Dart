// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoStreamImpl _$$VideoStreamImplFromJson(Map<String, dynamic> json) =>
    _$VideoStreamImpl(
      url: json['url'] as String?,
      resolution: json['resolution'] as String?,
      fps: (json['fps'] as num?)?.toInt() ?? 0,
      formatName: json['formatName'] as String?,
      formatSuffix: json['formatSuffix'] as String?,
      formatMimeType: json['formatMimeType'] as String?,
    );

Map<String, dynamic> _$$VideoStreamImplToJson(_$VideoStreamImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'resolution': instance.resolution,
      'fps': instance.fps,
      'formatName': instance.formatName,
      'formatSuffix': instance.formatSuffix,
      'formatMimeType': instance.formatMimeType,
    };
