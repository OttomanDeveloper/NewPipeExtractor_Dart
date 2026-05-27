import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/search_result.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

/// YouTube and YouTube Music search with pagination and autocomplete.
///
/// Pagination is stateful -- calling [searchYoutube] replaces the current
/// search context. [getNextPage] returns the next page of the most recent search.
class SearchExtractor {
  static final _api = SearchApi();

  /// Searches YouTube for the given query. Use [SearchFilter] values for type filtering.
  static Future<SearchResult> searchYoutube(String query, List<String> filters) async {
    final dto = await withReCaptchaRetry(() => _api.searchYoutube(query, filters));
    return m.mapSearchResult(dto);
  }

  /// Returns the next page of the most recent [searchYoutube] call.
  static Future<SearchResult> getNextPage() async {
    final dto = await withReCaptchaRetry(() => _api.getNextPage());
    return m.mapSearchResult(dto);
  }

  /// Searches YouTube Music. Automatically applies the music_songs content filter.
  static Future<SearchResult> searchYoutubeMusic(String query, List<String> filters) async {
    final dto = await withReCaptchaRetry(() => _api.searchYoutubeMusic(query, filters));
    return m.mapSearchResult(dto);
  }

  /// Returns the next page of the most recent [searchYoutubeMusic] call.
  static Future<SearchResult> getNextMusicPage() async {
    final dto = await withReCaptchaRetry(() => _api.getNextMusicPage());
    return m.mapSearchResult(dto);
  }

  /// Returns autocomplete suggestions for the given query.
  static Future<List<String>> getSearchSuggestions(String query) async {
    final result = await withReCaptchaRetry(() => _api.getSearchSuggestions(query));
    return result.whereType<String>().toList();
  }
}
