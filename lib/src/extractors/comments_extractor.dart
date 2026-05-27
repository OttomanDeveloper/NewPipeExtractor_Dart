import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/comments_page.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';
import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';

class CommentsExtractor {
  static final _api = CommentsApi();

  static Future<CommentsPage> getComments(String url) async {
    final dto = await withReCaptchaRetry(() => _api.getComments(url));
    return m.mapCommentsPage(dto);
  }

  static Future<CommentsPage> getNextCommentsPage() async {
    final dto = await withReCaptchaRetry(() => _api.getNextCommentsPage());
    return m.mapCommentsPage(dto);
  }
}
