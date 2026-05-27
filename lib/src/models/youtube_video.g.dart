// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YoutubeVideoImpl _$$YoutubeVideoImplFromJson(Map<String, dynamic> json) =>
    _$YoutubeVideoImpl(
      videoInfo: VideoInfo.fromJson(json['videoInfo'] as Map<String, dynamic>),
      audioOnlyStreams: (json['audioOnlyStreams'] as List<dynamic>?)
              ?.map((e) => AudioOnlyStream.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      videoOnlyStreams: (json['videoOnlyStreams'] as List<dynamic>?)
              ?.map((e) => VideoOnlyStream.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      videoStreams: (json['videoStreams'] as List<dynamic>?)
              ?.map((e) => VideoStream.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      subtitleStreams: (json['subtitleStreams'] as List<dynamic>?)
              ?.map((e) => SubtitleStream.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      segments: (json['segments'] as List<dynamic>?)
              ?.map((e) => StreamSegment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      framesets: (json['framesets'] as List<dynamic>?)
              ?.map((e) => Frameset.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$YoutubeVideoImplToJson(_$YoutubeVideoImpl instance) =>
    <String, dynamic>{
      'videoInfo': instance.videoInfo,
      'audioOnlyStreams': instance.audioOnlyStreams,
      'videoOnlyStreams': instance.videoOnlyStreams,
      'videoStreams': instance.videoStreams,
      'subtitleStreams': instance.subtitleStreams,
      'segments': instance.segments,
      'framesets': instance.framesets,
    };
