import 'package:freezed_annotation/freezed_annotation.dart';
part 'youtube_comment.freezed.dart';
part 'youtube_comment.g.dart';

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
  }) = _YoutubeComment;

  factory YoutubeComment.fromJson(Map<String, dynamic> json) =>
      _$YoutubeCommentFromJson(json);
}
