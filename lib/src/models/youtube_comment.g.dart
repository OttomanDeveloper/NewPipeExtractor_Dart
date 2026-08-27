// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YoutubeCommentImpl _$$YoutubeCommentImplFromJson(Map<String, dynamic> json) =>
    _$YoutubeCommentImpl(
      author: json['author'] as String?,
      commentText: json['commentText'] as String?,
      uploadDate: json['uploadDate'] as String?,
      uploaderAvatars: (json['uploaderAvatars'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      uploaderUrl: json['uploaderUrl'] as String?,
      commentId: json['commentId'] as String?,
      likeCount: (json['likeCount'] as num?)?.toInt(),
      hearted: json['hearted'] as bool? ?? false,
      pinned: json['pinned'] as bool? ?? false,
      replyCount: (json['replyCount'] as num?)?.toInt() ?? 0,
      isChannelOwner: json['isChannelOwner'] as bool? ?? false,
      isUploaderVerified: json['isUploaderVerified'] as bool? ?? false,
      streamPosition: (json['streamPosition'] as num?)?.toInt(),
      isEdited: json['isEdited'] as bool? ?? false,
    );

Map<String, dynamic> _$$YoutubeCommentImplToJson(
        _$YoutubeCommentImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'commentText': instance.commentText,
      'uploadDate': instance.uploadDate,
      'uploaderAvatars': instance.uploaderAvatars,
      'uploaderUrl': instance.uploaderUrl,
      'commentId': instance.commentId,
      'likeCount': instance.likeCount,
      'hearted': instance.hearted,
      'pinned': instance.pinned,
      'replyCount': instance.replyCount,
      'isChannelOwner': instance.isChannelOwner,
      'isUploaderVerified': instance.isUploaderVerified,
      'streamPosition': instance.streamPosition,
      'isEdited': instance.isEdited,
    };
