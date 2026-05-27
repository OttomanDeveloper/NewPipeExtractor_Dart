import 'package:freezed_annotation/freezed_annotation.dart';
part 'channel_info_item.freezed.dart';
part 'channel_info_item.g.dart';

@freezed
class ChannelInfoItem with _$ChannelInfoItem {
  const factory ChannelInfoItem({
    String? url,
    String? name,
    String? description,
    @Default([]) List<String> thumbnails,
    int? subscriberCount,
    @Default(0) int streamCount,
    @Default(false) bool isVerified,
  }) = _ChannelInfoItem;

  factory ChannelInfoItem.fromJson(Map<String, dynamic> json) =>
      _$ChannelInfoItemFromJson(json);
}
