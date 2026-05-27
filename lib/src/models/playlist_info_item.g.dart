// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_info_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaylistInfoItemImpl _$$PlaylistInfoItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaylistInfoItemImpl(
      url: json['url'] as String?,
      name: json['name'] as String?,
      uploaderName: json['uploaderName'] as String?,
      thumbnails: (json['thumbnails'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      streamCount: (json['streamCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PlaylistInfoItemImplToJson(
        _$PlaylistInfoItemImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'uploaderName': instance.uploaderName,
      'thumbnails': instance.thumbnails,
      'streamCount': instance.streamCount,
    };
