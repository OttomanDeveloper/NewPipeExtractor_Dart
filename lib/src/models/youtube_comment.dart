import 'package:freezed_annotation/freezed_annotation.dart';
part 'youtube_comment.freezed.dart';
part 'youtube_comment.g.dart';

/// A YouTube comment with author info, engagement metrics, and reply metadata.
@freezed
class YoutubeComment with _$YoutubeComment {
  const factory YoutubeComment({
    String? author,
    String? commentText,
    String? uploadDate,
    @Default([]) List<String> uploaderAvatars,
    String? uploaderUrl,
    String? commentId,
    int? likeCount,
    @Default(false) bool hearted,
    @Default(false) bool pinned,
    @Default(0) int replyCount,
    @Default(false) bool isChannelOwner,
    @Default(false) bool isUploaderVerified,

    /// Timestamp in the video this comment references, in seconds. Null if not a timestamped comment.
    int? streamPosition,

    /// Whether the comment was edited by its author.
    @Default(false) bool isEdited,
  }) = _YoutubeComment;

  factory YoutubeComment.fromJson(Map<String, dynamic> json) =>
      _$YoutubeCommentFromJson(json);
}
