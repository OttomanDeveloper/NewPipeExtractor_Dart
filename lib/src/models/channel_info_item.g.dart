// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_info_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChannelInfoItemImpl _$$ChannelInfoItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ChannelInfoItemImpl(
      url: json['url'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      thumbnails: (json['thumbnails'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subscriberCount: (json['subscriberCount'] as num?)?.toInt(),
      streamCount: (json['streamCount'] as num?)?.toInt() ?? 0,
      isVerified: json['isVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChannelInfoItemImplToJson(
        _$ChannelInfoItemImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'description': instance.description,
      'thumbnails': instance.thumbnails,
      'subscriberCount': instance.subscriberCount,
      'streamCount': instance.streamCount,
      'isVerified': instance.isVerified,
    };
