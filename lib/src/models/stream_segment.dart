import 'package:freezed_annotation/freezed_annotation.dart';
part 'stream_segment.freezed.dart';
part 'stream_segment.g.dart';

/// A video chapter/segment with title, preview image, and start time.
@freezed
class StreamSegment with _$StreamSegment {
  const factory StreamSegment({
    String? url,
    String? title,
    String? previewUrl,
    @Default(0) int startTimeSeconds,
  }) = _StreamSegment;

  factory StreamSegment.fromJson(Map<String, dynamic> json) =>
      _$StreamSegmentFromJson(json);
}
