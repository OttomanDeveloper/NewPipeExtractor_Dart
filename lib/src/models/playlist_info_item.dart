import 'package:freezed_annotation/freezed_annotation.dart';
part 'playlist_info_item.freezed.dart';
part 'playlist_info_item.g.dart';

@freezed
class PlaylistInfoItem with _$PlaylistInfoItem {
  const factory PlaylistInfoItem({
    String? url,
    String? name,
    String? uploaderName,
    @Default([]) List<String> thumbnails,
    @Default(0) int streamCount,
  }) = _PlaylistInfoItem;

  factory PlaylistInfoItem.fromJson(Map<String, dynamic> json) =>
      _$PlaylistInfoItemFromJson(json);
}
