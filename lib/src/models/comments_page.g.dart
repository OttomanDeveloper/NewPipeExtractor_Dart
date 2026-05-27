// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentsPageImpl _$$CommentsPageImplFromJson(Map<String, dynamic> json) =>
    _$CommentsPageImpl(
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => YoutubeComment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasNextPage: json['hasNextPage'] as bool? ?? false,
    );

Map<String, dynamic> _$$CommentsPageImplToJson(_$CommentsPageImpl instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'hasNextPage': instance.hasNextPage,
    };
