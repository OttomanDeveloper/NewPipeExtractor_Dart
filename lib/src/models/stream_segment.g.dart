// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreamSegmentImpl _$$StreamSegmentImplFromJson(Map<String, dynamic> json) =>
    _$StreamSegmentImpl(
      url: json['url'] as String?,
      title: json['title'] as String?,
      previewUrl: json['previewUrl'] as String?,
      startTimeSeconds: (json['startTimeSeconds'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$StreamSegmentImplToJson(_$StreamSegmentImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'previewUrl': instance.previewUrl,
      'startTimeSeconds': instance.startTimeSeconds,
    };
