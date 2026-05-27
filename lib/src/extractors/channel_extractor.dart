import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/channel_info_item.dart';
import 'package:newpipeextractor_dart/src/models/playlist_info_item.dart';
import 'package:newpipeextractor_dart/src/models/youtube_channel.dart';
import 'package:newpipeextractor_dart/src/models/stream_info_item.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

/// Extracts YouTube channel information, uploads, and tab-based content.
///
/// Channel tabs (Videos, Shorts, Live, Playlists) are accessed via
/// [getChannelTabContent] using [ChannelTab] filter values.
class ChannelExtractor {
  static final _api = ChannelApi();

  /// Returns channel metadata including subscriber count, verified status, and available tabs.
  static Future<YoutubeChannel> getChannelInfo(String url) async {
    final dto = await withReCaptchaRetry(() => _api.getChannelInfo(url));
    return m.mapChannel(dto);
  }

  /// Returns channel uploads via the RSS feed.
  static Future<List<StreamInfoItem>> getChannelUploads(String url) async {
    final dtos = await withReCaptchaRetry(() => _api.getChannelUploads(url));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  /// Returns the next page of channel uploads from [getChannelUploads].
  static Future<List<StreamInfoItem>> getChannelNextPage() async {
    final dtos = await withReCaptchaRetry(() => _api.getChannelNextPage());
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  /// Returns content from a specific channel tab (e.g., 'shorts', 'playlists', 'livestreams').
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

  /// Returns the next page of the most recent [getChannelTabContent] call.
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
