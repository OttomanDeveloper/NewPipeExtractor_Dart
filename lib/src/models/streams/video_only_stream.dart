import 'package:freezed_annotation/freezed_annotation.dart';
part 'video_only_stream.freezed.dart';
part 'video_only_stream.g.dart';

/// Video-only stream (no audio). Must be combined with an audio stream for playback.
@freezed
class VideoOnlyStream with _$VideoOnlyStream {
  const factory VideoOnlyStream({
    String? url,
    String? resolution,

    /// Frames per second.
    @Default(0) int fps,
    String? formatName,
    String? formatSuffix,
    String? formatMimeType,
  }) = _VideoOnlyStream;

  factory VideoOnlyStream.fromJson(Map<String, dynamic> json) =>
      _$VideoOnlyStreamFromJson(json);
}
