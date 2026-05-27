// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_only_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioOnlyStreamImpl _$$AudioOnlyStreamImplFromJson(
        Map<String, dynamic> json) =>
    _$AudioOnlyStreamImpl(
      url: json['url'] as String?,
      averageBitrate: (json['averageBitrate'] as num?)?.toInt() ?? 0,
      formatName: json['formatName'] as String?,
      formatSuffix: json['formatSuffix'] as String?,
      formatMimeType: json['formatMimeType'] as String?,
      audioTrackName: json['audioTrackName'] as String?,
      audioTrackLocale: json['audioTrackLocale'] as String?,
      audioTrackType: json['audioTrackType'] as String?,
    );

Map<String, dynamic> _$$AudioOnlyStreamImplToJson(
        _$AudioOnlyStreamImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'averageBitrate': instance.averageBitrate,
      'formatName': instance.formatName,
      'formatSuffix': instance.formatSuffix,
      'formatMimeType': instance.formatMimeType,
      'audioTrackName': instance.audioTrackName,
      'audioTrackLocale': instance.audioTrackLocale,
      'audioTrackType': instance.audioTrackType,
    };
