import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newpipeextractor_dart/src/models/enums.dart';
part 'video_info.freezed.dart';
part 'video_info.g.dart';

/// Complete metadata for a video/stream.
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

    /// Duration in seconds.
    int? length,
    int? viewCount,
    int? likeCount,
    int? dislikeCount,
    String? category,
    int? ageLimit,
    @Default([]) List<String> tags,
    @Default([]) List<String> thumbnails,

    /// Stream type (video, live, audio-only, etc.).
    @Default(StreamType.none) StreamType streamType,

    /// HLS manifest URL. Available for live streams.
    String? hlsUrl,

    /// DASH manifest URL for adaptive streaming.
    String? dashMpdUrl,

    /// Whether this is a YouTube Short.
    @Default(false) bool isShort,
    @Default(false) bool isUploaderVerified,
    @Default(Privacy.other) Privacy privacy,

    /// Uploader's subscriber count (from the video page).
    int? uploaderSubscriberCount,

    /// Sub-channel (topic channel) name, if applicable.
    String? subChannelName,
    String? subChannelUrl,
    @Default([]) List<String> subChannelAvatars,

    /// Content license string (e.g., "Creative Commons").
    String? licence,

    /// Creator support/donation information.
    String? supportInfo,
  }) = _VideoInfo;

  factory VideoInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoFromJson(json);
}
