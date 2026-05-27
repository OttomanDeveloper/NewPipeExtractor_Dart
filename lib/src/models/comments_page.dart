import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newpipeextractor_dart/src/models/youtube_comment.dart';
part 'comments_page.freezed.dart';
part 'comments_page.g.dart';

/// A page of comments with a flag indicating whether more pages are available.
@freezed
class CommentsPage with _$CommentsPage {
  const factory CommentsPage({
    @Default([]) List<YoutubeComment> comments,
    @Default(false) bool hasNextPage,
  }) = _CommentsPage;

  factory CommentsPage.fromJson(Map<String, dynamic> json) =>
      _$CommentsPageFromJson(json);
}
