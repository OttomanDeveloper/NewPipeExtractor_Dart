import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/youtube_channel.dart';
import 'package:newpipeextractor_dart/src/models/stream_info_item.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class ChannelExtractor {
  static final _api = ChannelApi();

  static Future<YoutubeChannel> getChannelInfo(String url) async {
    final dto = await withReCaptchaRetry(() => _api.getChannelInfo(url));
    return m.mapChannel(dto);
  }

  static Future<List<StreamInfoItem>> getChannelUploads(String url) async {
    final dtos = await withReCaptchaRetry(() => _api.getChannelUploads(url));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  static Future<List<StreamInfoItem>> getChannelNextPage() async {
    final dtos = await withReCaptchaRetry(() => _api.getChannelNextPage());
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  static Future<({List<StreamInfoItem> items, bool hasNextPage})> getChannelTabContent(
    String url, String tabFilter,
  ) async {
    final dto = await withReCaptchaRetry(() => _api.getChannelTabContent(url, tabFilter));
    return (
      items: dto.items?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      hasNextPage: dto.hasNextPage ?? false,
    );
  }

  static Future<({List<StreamInfoItem> items, bool hasNextPage})> getChannelTabNextPage() async {
    final dto = await withReCaptchaRetry(() => _api.getChannelTabNextPage());
    return (
      items: dto.items?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      hasNextPage: dto.hasNextPage ?? false,
    );
  }
}
