// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoInfoImpl _$$VideoInfoImplFromJson(Map<String, dynamic> json) =>
    _$VideoInfoImpl(
      id: json['id'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      uploaderName: json['uploaderName'] as String?,
      uploaderUrl: json['uploaderUrl'] as String?,
      uploaderAvatars: (json['uploaderAvatars'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      uploadDate: json['uploadDate'] as String?,
      description: json['description'] as String?,
      length: (json['length'] as num?)?.toInt(),
      viewCount: (json['viewCount'] as num?)?.toInt(),
      likeCount: (json['likeCount'] as num?)?.toInt(),
      dislikeCount: (json['dislikeCount'] as num?)?.toInt(),
      category: json['category'] as String?,
      ageLimit: (json['ageLimit'] as num?)?.toInt(),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      thumbnails: (json['thumbnails'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      streamType:
          $enumDecodeNullable(_$StreamTypeEnumMap, json['streamType']) ??
              StreamType.none,
      hlsUrl: json['hlsUrl'] as String?,
      dashMpdUrl: json['dashMpdUrl'] as String?,
      isShort: json['isShort'] as bool? ?? false,
      isUploaderVerified: json['isUploaderVerified'] as bool? ?? false,
      privacy: $enumDecodeNullable(_$PrivacyEnumMap, json['privacy']) ??
          Privacy.other,
      uploaderSubscriberCount:
          (json['uploaderSubscriberCount'] as num?)?.toInt(),
      subChannelName: json['subChannelName'] as String?,
      subChannelUrl: json['subChannelUrl'] as String?,
      subChannelAvatars: (json['subChannelAvatars'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      licence: json['licence'] as String?,
      supportInfo: json['supportInfo'] as String?,
    );

Map<String, dynamic> _$$VideoInfoImplToJson(_$VideoInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'uploaderName': instance.uploaderName,
      'uploaderUrl': instance.uploaderUrl,
      'uploaderAvatars': instance.uploaderAvatars,
      'uploadDate': instance.uploadDate,
      'description': instance.description,
      'length': instance.length,
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'category': instance.category,
      'ageLimit': instance.ageLimit,
      'tags': instance.tags,
      'thumbnails': instance.thumbnails,
      'streamType': _$StreamTypeEnumMap[instance.streamType]!,
      'hlsUrl': instance.hlsUrl,
      'dashMpdUrl': instance.dashMpdUrl,
      'isShort': instance.isShort,
      'isUploaderVerified': instance.isUploaderVerified,
      'privacy': _$PrivacyEnumMap[instance.privacy]!,
      'uploaderSubscriberCount': instance.uploaderSubscriberCount,
      'subChannelName': instance.subChannelName,
      'subChannelUrl': instance.subChannelUrl,
      'subChannelAvatars': instance.subChannelAvatars,
      'licence': instance.licence,
      'supportInfo': instance.supportInfo,
    };

const _$StreamTypeEnumMap = {
  StreamType.videoStream: 'videoStream',
  StreamType.audioStream: 'audioStream',
  StreamType.liveStream: 'liveStream',
  StreamType.audioLiveStream: 'audioLiveStream',
  StreamType.postLiveStream: 'postLiveStream',
  StreamType.none: 'none',
};

const _$PrivacyEnumMap = {
  Privacy.public_: 'public_',
  Privacy.unlisted: 'unlisted',
  Privacy.private_: 'private_',
  Privacy.internal_: 'internal_',
  Privacy.other: 'other',
};
