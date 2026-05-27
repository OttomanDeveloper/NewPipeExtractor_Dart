import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/stream_info_item.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class TrendingExtractor {
  static final _api = TrendingApi();

  static Future<List<StreamInfoItem>> getTrendingVideos() async {
    final dtos = await withReCaptchaRetry(() => _api.getTrendingVideos());
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  static Future<List<String>> listKiosks() async {
    final result = await withReCaptchaRetry(() => _api.listKiosks());
    return result.whereType<String>().toList();
  }

  static Future<List<StreamInfoItem>> getKioskContent(String kioskId) async {
    final dtos = await withReCaptchaRetry(() => _api.getKioskContent(kioskId));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }
}
