import 'package:freezed_annotation/freezed_annotation.dart';
part 'video_only_stream.freezed.dart';
part 'video_only_stream.g.dart';

@freezed
class VideoOnlyStream with _$VideoOnlyStream {
  const factory VideoOnlyStream({
    String? url,
    String? resolution,
    @Default(0) int fps,
    String? formatName,
    String? formatSuffix,
    String? formatMimeType,
  }) = _VideoOnlyStream;

  factory VideoOnlyStream.fromJson(Map<String, dynamic> json) =>
      _$VideoOnlyStreamFromJson(json);
}
