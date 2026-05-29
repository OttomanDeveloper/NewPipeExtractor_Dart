import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/service_info.dart';
import 'package:newpipeextractor_dart/src/models/video_info.dart';
import 'package:newpipeextractor_dart/src/models/youtube_video.dart';
import 'package:newpipeextractor_dart/src/models/youtube_channel.dart';
import 'package:newpipeextractor_dart/src/models/youtube_playlist.dart';
import 'package:newpipeextractor_dart/src/models/search_result.dart';
import 'package:newpipeextractor_dart/src/models/stream_info_item.dart';
import 'package:newpipeextractor_dart/src/models/channel_info_item.dart';
import 'package:newpipeextractor_dart/src/models/playlist_info_item.dart';
import 'package:newpipeextractor_dart/src/models/comments_page.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

/// Generic extractor that works across all supported services (YouTube, SoundCloud,
/// Bandcamp, PeerTube, media.ccc.de). Use [ServiceId] enum for the serviceId parameter.
///
/// For YouTube-specific features (channel tabs, music search), use the dedicated
/// extractors ([VideoExtractor], [SearchExtractor], etc.) instead.
class ServiceExtractor {
  static final _serviceApi = ServiceApi();
  static final _streamApi = ServiceStreamApi();
  static final _searchApi = ServiceSearchApi();
  static final _channelApi = ServiceChannelApi();
  static final _playlistApi = ServicePlaylistApi();
  static final _kioskApi = ServiceKioskApi();
  static final _commentsApi = ServiceCommentsApi();

  // ─── Services ────────────────────────────────────────

  /// Returns all available extraction services with their IDs and names.
  static Future<List<ServiceInfo>> getAvailableServices() async {
    final dtos = await _serviceApi.getAvailableServices();
    return dtos.whereType<ServiceInfoDto>().map(m.mapServiceInfo).toList();
  }

  // ─── Streams ─────────────────────────────────────────

  /// Returns stream metadata for any service.
  static Future<VideoInfo> getStreamInfo(int serviceId, String url) async {
    final dto = await withReCaptchaRetry(() => _streamApi.getStreamInfo(serviceId, url));
    return m.mapVideoInfo(dto);
  }

  /// Returns full stream info with all media streams for any service.
  static Future<YoutubeVideo> getStream(int serviceId, String url) async {
    final info = await withReCaptchaRetry(() => _streamApi.getStreamInfo(serviceId, url));
    final streams = await withReCaptchaRetry(() => _streamApi.getStreams(serviceId, url));
    return m.mapYoutubeVideo(info, streams);
  }

  /// Returns related content for a stream.
  static Future<SearchResult> getRelatedItems(int serviceId, String url) async {
    final dto = await withReCaptchaRetry(() => _streamApi.getRelatedItems(serviceId, url));
    return m.mapSearchResult(dto);
  }

  // ─── Search ──────────────────────────────────────────

  /// Searches any service. Pagination state is stored per serviceId.
  static Future<SearchResult> search(int serviceId, String query, List<String> filters) async {
    final dto = await withReCaptchaRetry(() => _searchApi.search(serviceId, query, filters));
    return m.mapSearchResult(dto);
  }

  /// Returns the next page of search results for a specific service.
  static Future<SearchResult> searchNextPage(int serviceId) async {
    final dto = await withReCaptchaRetry(() => _searchApi.searchNextPage(serviceId));
    return m.mapSearchResult(dto);
  }

  /// Returns autocomplete suggestions from any service.
  static Future<List<String>> getSuggestions(int serviceId, String query) async {
    final result = await withReCaptchaRetry(() => _searchApi.getSuggestions(serviceId, query));
    return result.whereType<String>().toList();
  }

  // ─── Channels ────────────────────────────────────────

  /// Returns channel/artist info from any service.
  static Future<YoutubeChannel> getChannelInfo(int serviceId, String url) async {
    final dto = await withReCaptchaRetry(() => _channelApi.getChannelInfo(serviceId, url));
    return m.mapChannel(dto);
  }

  /// Returns channel content from any service.
  static Future<List<StreamInfoItem>> getChannelContent(int serviceId, String url) async {
    final dtos = await withReCaptchaRetry(() => _channelApi.getChannelContent(serviceId, url));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  /// Returns the next page of channel content.
  static Future<List<StreamInfoItem>> getChannelContentNextPage(int serviceId) async {
    final dtos = await withReCaptchaRetry(() => _channelApi.getChannelContentNextPage(serviceId));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  /// Returns content from a specific channel tab (e.g. 'videos', 'playlists') for
  /// services that expose tabs. Throws if the tab is unavailable for the service.
  static Future<({List<StreamInfoItem> streams, List<PlaylistInfoItem> playlists, List<ChannelInfoItem> channels, bool hasNextPage})>
      getChannelTabContent(int serviceId, String url, String tabFilter) async {
    final dto = await withReCaptchaRetry(() => _channelApi.getServiceChannelTabContent(serviceId, url, tabFilter));
    return m.mapTabPage(dto);
  }

  /// Returns the next page of the most recent [getChannelTabContent] call for a service.
  static Future<({List<StreamInfoItem> streams, List<PlaylistInfoItem> playlists, List<ChannelInfoItem> channels, bool hasNextPage})>
      getChannelTabNextPage(int serviceId) async {
    final dto = await withReCaptchaRetry(() => _channelApi.getServiceChannelTabNextPage(serviceId));
    return m.mapTabPage(dto);
  }

  // ─── Playlists ───────────────────────────────────────

  /// Returns playlist/album info from any service.
  static Future<YoutubePlaylist> getPlaylistInfo(int serviceId, String url) async {
    final dto = await withReCaptchaRetry(() => _playlistApi.getPlaylistInfo(serviceId, url));
    return m.mapPlaylist(dto);
  }

  /// Returns playlist/album tracks from any service.
  static Future<List<StreamInfoItem>> getPlaylistContent(int serviceId, String url) async {
    final dtos = await withReCaptchaRetry(() => _playlistApi.getPlaylistContent(serviceId, url));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  /// Returns the next page of playlist tracks.
  static Future<List<StreamInfoItem>> getPlaylistContentNextPage(int serviceId) async {
    final dtos = await withReCaptchaRetry(() => _playlistApi.getPlaylistContentNextPage(serviceId));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  // ─── Kiosks ──────────────────────────────────────────

  /// Returns available kiosk IDs for a service (e.g., charts, trending).
  static Future<List<String>> listKiosks(int serviceId) async {
    final result = await _kioskApi.listServiceKiosks(serviceId);
    return result.whereType<String>().toList();
  }

  /// Returns content from a specific kiosk.
  static Future<List<StreamInfoItem>> getKioskContent(int serviceId, String kioskId) async {
    final dtos = await withReCaptchaRetry(() => _kioskApi.getServiceKioskContent(serviceId, kioskId));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  // ─── Comments ────────────────────────────────────────

  /// Returns the first page of comments for a stream on any service that supports
  /// them. Throws if the service has no comments extractor.
  static Future<CommentsPage> getComments(int serviceId, String url) async {
    final dto = await withReCaptchaRetry(() => _commentsApi.getComments(serviceId, url));
    return m.mapCommentsPage(dto);
  }

  /// Returns the next page of comments for a service. Pagination state is stored
  /// per serviceId. Returns an empty page when there are no more comments.
  static Future<CommentsPage> getCommentsNextPage(int serviceId) async {
    final dto = await withReCaptchaRetry(() => _commentsApi.getNextCommentsPage(serviceId));
    return m.mapCommentsPage(dto);
  }
}
