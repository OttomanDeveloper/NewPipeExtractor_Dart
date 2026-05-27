import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class CommentsExtractor {
  static final _api = CommentsApi();

  static Future<CommentsPageDto> getComments(String url) =>
      withReCaptchaRetry(() => _api.getComments(url));

  static Future<CommentsPageDto> getNextCommentsPage() =>
      withReCaptchaRetry(() => _api.getNextCommentsPage());
}
