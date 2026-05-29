import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/stream_info_item.dart';
import 'package:newpipeextractor_dart/src/models/page_token.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

/// Extracts YouTube trending content and kiosk browsing with stateless token
/// pagination.
class TrendingExtractor {
  static final _api = TrendingApi();

  /// Returns the current trending videos plus a continuation [PageToken].
  static Future<({List<StreamInfoItem> items, PageToken? next})> getTrendingVideos() async {
    final dto = await withReCaptchaRetry(() => _api.getTrendingVideos());
    return (
      items: dto.items?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      next: PageToken.fromDto(dto.nextPage),
    );
  }

  /// Returns the next page of trending videos for the given [token].
  static Future<({List<StreamInfoItem> items, PageToken? next})> getTrendingNextPage(PageToken token) async {
    final dto = await withReCaptchaRetry(() => _api.getTrendingNextPage(token.toDto()));
    return (
      items: dto.items?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      next: PageToken.fromDto(dto.nextPage),
    );
  }

  /// Returns available kiosk IDs (e.g., "Trending", "Top 50", "New & Hot").
  static Future<List<String>> listKiosks() async {
    final result = await withReCaptchaRetry(() => _api.listKiosks());
    return result.whereType<String>().toList();
  }

  /// Returns the first page of a specific kiosk plus a continuation [PageToken].
  static Future<({List<StreamInfoItem> items, PageToken? next})> getKioskContent(String kioskId) async {
    final dto = await withReCaptchaRetry(() => _api.getKioskContent(kioskId));
    return (
      items: dto.items?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      next: PageToken.fromDto(dto.nextPage),
    );
  }

  /// Returns the next page of a kiosk for the given [token].
  static Future<({List<StreamInfoItem> items, PageToken? next})> getKioskNextPage(
    String kioskId,
    PageToken token,
  ) async {
    final dto = await withReCaptchaRetry(() => _api.getKioskNextPage(kioskId, token.toDto()));
    return (
      items: dto.items?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      next: PageToken.fromDto(dto.nextPage),
    );
  }
}
