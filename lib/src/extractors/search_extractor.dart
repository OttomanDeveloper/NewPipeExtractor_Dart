import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/search_result.dart';
import 'package:newpipeextractor_dart/src/models/page_token.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

/// YouTube and YouTube Music search with stateless token pagination and autocomplete.
///
/// Each call returns the result plus a [PageToken] (`next`); pass that token to
/// the matching `...NextPage` call to fetch the following page. Because the
/// cursor lives in the token (not in native state), independent searches never
/// clobber each other's pagination.
class SearchExtractor {
  static final _api = SearchApi();

  /// Searches YouTube. Use [SearchFilter] values for type filtering.
  static Future<({SearchResult result, PageToken? next})> searchYoutube(
    String query,
    List<String> filters,
  ) async {
    final dto = await withReCaptchaRetry(() => _api.searchYoutube(query, filters));
    return (result: m.mapSearchResult(dto), next: PageToken.fromDto(dto.nextPage));
  }

  /// Returns the next page of a [searchYoutube] result for the given [token].
  static Future<({SearchResult result, PageToken? next})> searchNextPage(
    String query,
    List<String> filters,
    PageToken token,
  ) async {
    final dto = await withReCaptchaRetry(() => _api.searchNextPage(query, filters, token.toDto()));
    return (result: m.mapSearchResult(dto), next: PageToken.fromDto(dto.nextPage));
  }

  /// Searches YouTube Music. Automatically applies the music_songs content filter.
  static Future<({SearchResult result, PageToken? next})> searchYoutubeMusic(
    String query,
    List<String> filters,
  ) async {
    final dto = await withReCaptchaRetry(() => _api.searchYoutubeMusic(query, filters));
    return (result: m.mapSearchResult(dto), next: PageToken.fromDto(dto.nextPage));
  }

  /// Returns the next page of a [searchYoutubeMusic] result for the given [token].
  static Future<({SearchResult result, PageToken? next})> searchMusicNextPage(
    String query,
    List<String> filters,
    PageToken token,
  ) async {
    final dto = await withReCaptchaRetry(() => _api.searchMusicNextPage(query, filters, token.toDto()));
    return (result: m.mapSearchResult(dto), next: PageToken.fromDto(dto.nextPage));
  }

  /// Returns autocomplete suggestions for the given query.
  static Future<List<String>> getSearchSuggestions(String query) async {
    final result = await withReCaptchaRetry(() => _api.getSearchSuggestions(query));
    return result.whereType<String>().toList();
  }
}
