import 'package:freezed_annotation/freezed_annotation.dart';
part 'audio_only_stream.freezed.dart';
part 'audio_only_stream.g.dart';

/// Audio-only stream with bitrate, format, and multi-audio track metadata.
@freezed
class AudioOnlyStream with _$AudioOnlyStream {
  const factory AudioOnlyStream({
    String? url,

    /// Bitrate in kbps.
    @Default(0) int averageBitrate,
    String? formatName,
    String? formatSuffix,
    String? formatMimeType,
    String? audioTrackName,
    String? audioTrackLocale,

    /// Audio track type: ORIGINAL, DUBBED, or DESCRIPTIVE.
    String? audioTrackType,
  }) = _AudioOnlyStream;

  factory AudioOnlyStream.fromJson(Map<String, dynamic> json) =>
      _$AudioOnlyStreamFromJson(json);
}
