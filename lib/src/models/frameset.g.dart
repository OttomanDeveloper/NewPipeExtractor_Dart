// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frameset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FramesetImpl _$$FramesetImplFromJson(Map<String, dynamic> json) =>
    _$FramesetImpl(
      urls:
          (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      width: (json['width'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt() ?? 0,
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FramesetImplToJson(_$FramesetImpl instance) =>
    <String, dynamic>{
      'urls': instance.urls,
      'width': instance.width,
      'height': instance.height,
      'totalCount': instance.totalCount,
    };
