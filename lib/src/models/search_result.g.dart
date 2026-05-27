// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResultImpl _$$SearchResultImplFromJson(Map<String, dynamic> json) =>
    _$SearchResultImpl(
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => StreamInfoItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playlists: (json['playlists'] as List<dynamic>?)
              ?.map((e) => PlaylistInfoItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      channels: (json['channels'] as List<dynamic>?)
              ?.map((e) => ChannelInfoItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SearchResultImplToJson(_$SearchResultImpl instance) =>
    <String, dynamic>{
      'videos': instance.videos,
      'playlists': instance.playlists,
      'channels': instance.channels,
    };
