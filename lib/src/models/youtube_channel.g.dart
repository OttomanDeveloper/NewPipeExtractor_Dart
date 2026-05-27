// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YoutubeChannelImpl _$$YoutubeChannelImplFromJson(Map<String, dynamic> json) =>
    _$YoutubeChannelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      avatars: (json['avatars'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      banners: (json['banners'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String?,
      feedUrl: json['feedUrl'] as String?,
      subscriberCount: (json['subscriberCount'] as num?)?.toInt(),
      isVerified: json['isVerified'] as bool? ?? false,
      tabs: (json['tabs'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ChannelTabEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$YoutubeChannelImplToJson(
        _$YoutubeChannelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'avatars': instance.avatars,
      'banners': instance.banners,
      'description': instance.description,
      'feedUrl': instance.feedUrl,
      'subscriberCount': instance.subscriberCount,
      'isVerified': instance.isVerified,
      'tabs': instance.tabs.map((e) => _$ChannelTabEnumMap[e]!).toList(),
    };

const _$ChannelTabEnumMap = {
  ChannelTab.videos: 'videos',
  ChannelTab.shorts: 'shorts',
  ChannelTab.live: 'live',
  ChannelTab.playlists: 'playlists',
  ChannelTab.channels: 'channels',
  ChannelTab.albums: 'albums',
};
