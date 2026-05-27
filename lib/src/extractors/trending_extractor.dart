import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/stream_info_item.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

/// Extracts YouTube trending content and kiosk browsing.
class TrendingExtractor {
  static final _api = TrendingApi();

  /// Returns the current trending videos using the device locale.
  static Future<List<StreamInfoItem>> getTrendingVideos() async {
    final dtos = await withReCaptchaRetry(() => _api.getTrendingVideos());
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  /// Returns available kiosk IDs (e.g., "Trending", "Top 50", "New & Hot").
  static Future<List<String>> listKiosks() async {
    final result = await withReCaptchaRetry(() => _api.listKiosks());
    return result.whereType<String>().toList();
  }

  /// Returns content from a specific kiosk by ID.
  static Future<List<StreamInfoItem>> getKioskContent(String kioskId) async {
    final dtos = await withReCaptchaRetry(() => _api.getKioskContent(kioskId));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }
}
