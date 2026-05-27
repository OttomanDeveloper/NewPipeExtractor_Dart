import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/comments_page.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';
import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';

/// Extracts YouTube comments with pagination and reply thread support.
class CommentsExtractor {
  static final _api = CommentsApi();

  /// Returns the first page of comments for a video.
  static Future<CommentsPage> getComments(String url) async {
    final dto = await withReCaptchaRetry(() => _api.getComments(url));
    return m.mapCommentsPage(dto);
  }

  /// Returns the next page of comments from [getComments].
  static Future<CommentsPage> getNextCommentsPage() async {
    final dto = await withReCaptchaRetry(() => _api.getNextCommentsPage());
    return m.mapCommentsPage(dto);
  }

  /// Returns replies for a comment by its cumulative index across all fetched pages.
  /// Index 0 is the first comment from [getComments], and indices continue
  /// incrementally through subsequent [getNextCommentsPage] calls.
  static Future<CommentsPage> getCommentReplies(int commentIndex) async {
    final dto = await withReCaptchaRetry(() => _api.getCommentReplies(commentIndex));
    return m.mapCommentsPage(dto);
  }
}
