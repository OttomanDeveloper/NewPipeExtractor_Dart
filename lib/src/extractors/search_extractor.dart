import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/search_result.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class SearchExtractor {
  static final _api = SearchApi();

  static Future<SearchResult> searchYoutube(String query, List<String> filters) async {
    final dto = await withReCaptchaRetry(() => _api.searchYoutube(query, filters));
    return m.mapSearchResult(dto);
  }

  static Future<SearchResult> getNextPage() async {
    final dto = await withReCaptchaRetry(() => _api.getNextPage());
    return m.mapSearchResult(dto);
  }

  static Future<SearchResult> searchYoutubeMusic(String query, List<String> filters) async {
    final dto = await withReCaptchaRetry(() => _api.searchYoutubeMusic(query, filters));
    return m.mapSearchResult(dto);
  }

  static Future<SearchResult> getNextMusicPage() async {
    final dto = await withReCaptchaRetry(() => _api.getNextMusicPage());
    return m.mapSearchResult(dto);
  }

  static Future<List<String>> getSearchSuggestions(String query) async {
    final result = await withReCaptchaRetry(() => _api.getSearchSuggestions(query));
    return result.whereType<String>().toList();
  }
}
