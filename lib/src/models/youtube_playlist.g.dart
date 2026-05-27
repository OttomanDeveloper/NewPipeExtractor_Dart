// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YoutubePlaylistImpl _$$YoutubePlaylistImplFromJson(
        Map<String, dynamic> json) =>
    _$YoutubePlaylistImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      uploaderName: json['uploaderName'] as String?,
      uploaderAvatars: (json['uploaderAvatars'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      uploaderUrl: json['uploaderUrl'] as String?,
      banners: (json['banners'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      thumbnails: (json['thumbnails'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      streamCount: (json['streamCount'] as num?)?.toInt() ?? 0,
      description: json['description'] as String?,
      playlistType:
          $enumDecodeNullable(_$PlaylistTypeEnumMap, json['playlistType']) ??
              PlaylistType.normal,
    );

Map<String, dynamic> _$$YoutubePlaylistImplToJson(
        _$YoutubePlaylistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'uploaderName': instance.uploaderName,
      'uploaderAvatars': instance.uploaderAvatars,
      'uploaderUrl': instance.uploaderUrl,
      'banners': instance.banners,
      'thumbnails': instance.thumbnails,
      'streamCount': instance.streamCount,
      'description': instance.description,
      'playlistType': _$PlaylistTypeEnumMap[instance.playlistType]!,
    };

const _$PlaylistTypeEnumMap = {
  PlaylistType.normal: 'normal',
  PlaylistType.mixStream: 'mixStream',
  PlaylistType.mixChannel: 'mixChannel',
  PlaylistType.mixAlbum: 'mixAlbum',
};
