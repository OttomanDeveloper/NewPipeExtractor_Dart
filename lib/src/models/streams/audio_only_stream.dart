import 'package:freezed_annotation/freezed_annotation.dart';
part 'audio_only_stream.freezed.dart';
part 'audio_only_stream.g.dart';

@freezed
class AudioOnlyStream with _$AudioOnlyStream {
  const factory AudioOnlyStream({
    String? url,
    @Default(0) int averageBitrate,
    String? formatName,
    String? formatSuffix,
    String? formatMimeType,
    String? audioTrackName,
    String? audioTrackLocale,
    String? audioTrackType,
  }) = _AudioOnlyStream;

  factory AudioOnlyStream.fromJson(Map<String, dynamic> json) =>
      _$AudioOnlyStreamFromJson(json);
}
