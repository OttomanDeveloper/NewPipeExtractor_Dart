import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/channel_info_item.dart';
import 'package:newpipeextractor_dart/src/models/playlist_info_item.dart';
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

  static Future<({List<StreamInfoItem> streams, List<PlaylistInfoItem> playlists, List<ChannelInfoItem> channels, bool hasNextPage})> getChannelTabContent(
    String url, String tabFilter,
  ) async {
    final dto = await withReCaptchaRetry(() => _api.getChannelTabContent(url, tabFilter));
    return (
      streams: dto.streamItems?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      playlists: dto.playlistItems?.whereType<PlaylistInfoItemDto>().map(m.mapPlaylistInfoItem).toList() ?? [],
      channels: dto.channelItems?.whereType<ChannelInfoItemDto>().map(m.mapChannelInfoItem).toList() ?? [],
      hasNextPage: dto.hasNextPage ?? false,
    );
  }

  static Future<({List<StreamInfoItem> streams, List<PlaylistInfoItem> playlists, List<ChannelInfoItem> channels, bool hasNextPage})> getChannelTabNextPage() async {
    final dto = await withReCaptchaRetry(() => _api.getChannelTabNextPage());
    return (
      streams: dto.streamItems?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      playlists: dto.playlistItems?.whereType<PlaylistInfoItemDto>().map(m.mapPlaylistInfoItem).toList() ?? [],
      channels: dto.channelItems?.whereType<ChannelInfoItemDto>().map(m.mapChannelInfoItem).toList() ?? [],
      hasNextPage: dto.hasNextPage ?? false,
    );
  }
}
