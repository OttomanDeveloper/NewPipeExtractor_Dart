import 'package:freezed_annotation/freezed_annotation.dart';
part 'stream_info_item.freezed.dart';
part 'stream_info_item.g.dart';

@freezed
class StreamInfoItem with _$StreamInfoItem {
  const factory StreamInfoItem({
    String? url,
    String? id,
    String? name,
    String? uploaderName,
    String? uploaderUrl,
    @Default([]) List<String> uploaderAvatars,
    String? uploadDate,
    String? date,
    int? duration,
    int? viewCount,
    @Default(false) bool isShort,
    @Default([]) List<String> thumbnails,
  }) = _StreamInfoItem;

  factory StreamInfoItem.fromJson(Map<String, dynamic> json) =>
      _$StreamInfoItemFromJson(json);
}
