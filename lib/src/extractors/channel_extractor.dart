import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/channel_info_item.dart';
import 'package:newpipeextractor_dart/src/models/playlist_info_item.dart';
import 'package:newpipeextractor_dart/src/models/youtube_channel.dart';
import 'package:newpipeextractor_dart/src/models/stream_info_item.dart';
import 'package:newpipeextractor_dart/src/models/page_token.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

/// Extracts YouTube channel information, uploads, and tab-based content with
/// stateless token pagination.
class ChannelExtractor {
  static final _api = ChannelApi();

  /// Returns channel metadata including subscriber count, verified status, and available tabs.
  static Future<YoutubeChannel> getChannelInfo(String url) async {
    final dto = await withReCaptchaRetry(() => _api.getChannelInfo(url));
    return m.mapChannel(dto);
  }

  /// Returns the first page of channel uploads plus a continuation [PageToken].
  static Future<({List<StreamInfoItem> items, PageToken? next})> getChannelUploads(String url) async {
    final dto = await withReCaptchaRetry(() => _api.getChannelUploads(url));
    return (
      items: dto.items?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      next: PageToken.fromDto(dto.nextPage),
    );
  }

  /// Returns the next page of channel uploads for the given [token].
  static Future<({List<StreamInfoItem> items, PageToken? next})> getChannelNextPage(
    String url,
    PageToken token,
  ) async {
    final dto = await withReCaptchaRetry(() => _api.getChannelNextPage(url, token.toDto()));
    return (
      items: dto.items?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      next: PageToken.fromDto(dto.nextPage),
    );
  }

  /// Returns content from a specific channel tab (e.g., 'shorts', 'playlists', 'livestreams').
  static Future<({List<StreamInfoItem> streams, List<PlaylistInfoItem> playlists, List<ChannelInfoItem> channels, bool hasNextPage, PageToken? next})> getChannelTabContent(
    String url,
    String tabFilter,
  ) async {
    final dto = await withReCaptchaRetry(() => _api.getChannelTabContent(url, tabFilter));
    return (
      streams: dto.streamItems?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      playlists: dto.playlistItems?.whereType<PlaylistInfoItemDto>().map(m.mapPlaylistInfoItem).toList() ?? [],
      channels: dto.channelItems?.whereType<ChannelInfoItemDto>().map(m.mapChannelInfoItem).toList() ?? [],
      hasNextPage: dto.hasNextPage ?? false,
      next: PageToken.fromDto(dto.nextPage),
    );
  }

  /// Returns the next page of a channel tab for the given [token].
  static Future<({List<StreamInfoItem> streams, List<PlaylistInfoItem> playlists, List<ChannelInfoItem> channels, bool hasNextPage, PageToken? next})> getChannelTabNextPage(
    String url,
    String tabFilter,
    PageToken token,
  ) async {
    final dto = await withReCaptchaRetry(() => _api.getChannelTabNextPage(url, tabFilter, token.toDto()));
    return (
      streams: dto.streamItems?.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList() ?? [],
      playlists: dto.playlistItems?.whereType<PlaylistInfoItemDto>().map(m.mapPlaylistInfoItem).toList() ?? [],
      channels: dto.channelItems?.whereType<ChannelInfoItemDto>().map(m.mapChannelInfoItem).toList() ?? [],
      hasNextPage: dto.hasNextPage ?? false,
      next: PageToken.fromDto(dto.nextPage),
    );
  }
}
