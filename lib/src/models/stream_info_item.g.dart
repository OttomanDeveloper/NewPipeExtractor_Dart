// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_info_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreamInfoItemImpl _$$StreamInfoItemImplFromJson(Map<String, dynamic> json) =>
    _$StreamInfoItemImpl(
      url: json['url'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      uploaderName: json['uploaderName'] as String?,
      uploaderUrl: json['uploaderUrl'] as String?,
      uploaderAvatars: (json['uploaderAvatars'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      uploadDate: json['uploadDate'] as String?,
      date: json['date'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      viewCount: (json['viewCount'] as num?)?.toInt(),
      isShort: json['isShort'] as bool? ?? false,
      thumbnails: (json['thumbnails'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StreamInfoItemImplToJson(
        _$StreamInfoItemImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
      'name': instance.name,
      'uploaderName': instance.uploaderName,
      'uploaderUrl': instance.uploaderUrl,
      'uploaderAvatars': instance.uploaderAvatars,
      'uploadDate': instance.uploadDate,
      'date': instance.date,
      'duration': instance.duration,
      'viewCount': instance.viewCount,
      'isShort': instance.isShort,
      'thumbnails': instance.thumbnails,
    };
