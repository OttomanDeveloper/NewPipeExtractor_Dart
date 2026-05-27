import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class SearchExtractor {
  static final _api = SearchApi();

  static Future<SearchResultDto> searchYoutube(String query, List<String> filters) =>
      withReCaptchaRetry(() => _api.searchYoutube(query, filters));

  static Future<SearchResultDto> getNextPage() =>
      withReCaptchaRetry(() => _api.getNextPage());

  static Future<SearchResultDto> searchYoutubeMusic(String query, List<String> filters) =>
      withReCaptchaRetry(() => _api.searchYoutubeMusic(query, filters));

  static Future<SearchResultDto> getNextMusicPage() =>
      withReCaptchaRetry(() => _api.getNextMusicPage());

  static Future<List<String?>> getSearchSuggestions(String query) =>
      withReCaptchaRetry(() => _api.getSearchSuggestions(query));
}
