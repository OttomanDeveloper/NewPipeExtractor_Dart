import 'package:freezed_annotation/freezed_annotation.dart';
part 'video_stream.freezed.dart';
part 'video_stream.g.dart';

/// Muxed stream containing both video and audio. Capped at 720p by YouTube.
@freezed
class VideoStream with _$VideoStream {
  const factory VideoStream({
    String? url,
    String? resolution,
    @Default(0) int fps,
    String? formatName,
    String? formatSuffix,
    String? formatMimeType,
  }) = _VideoStream;

  factory VideoStream.fromJson(Map<String, dynamic> json) =>
      _$VideoStreamFromJson(json);
}
