import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newpipeextractor_dart/src/models/enums.dart';
part 'video_info.freezed.dart';
part 'video_info.g.dart';

@freezed
class VideoInfo with _$VideoInfo {
  const factory VideoInfo({
    String? id,
    String? url,
    String? name,
    String? uploaderName,
    String? uploaderUrl,
    @Default([]) List<String> uploaderAvatars,
    String? uploadDate,
    String? description,
    int? length,
    int? viewCount,
    int? likeCount,
    int? dislikeCount,
    String? category,
    int? ageLimit,
    @Default([]) List<String> tags,
    @Default([]) List<String> thumbnails,
    @Default(StreamType.none) StreamType streamType,
    String? hlsUrl,
    String? dashMpdUrl,
    @Default(false) bool isShort,
    @Default(false) bool isUploaderVerified,
    @Default(Privacy.other) Privacy privacy,
  }) = _VideoInfo;

  factory VideoInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoFromJson(json);
}
