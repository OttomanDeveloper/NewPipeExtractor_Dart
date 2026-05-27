import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/service_info.dart';
import 'package:newpipeextractor_dart/src/models/video_info.dart';
import 'package:newpipeextractor_dart/src/models/youtube_video.dart';
import 'package:newpipeextractor_dart/src/models/youtube_channel.dart';
import 'package:newpipeextractor_dart/src/models/youtube_playlist.dart';
import 'package:newpipeextractor_dart/src/models/search_result.dart';
import 'package:newpipeextractor_dart/src/models/stream_info_item.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class ServiceExtractor {
  static final _serviceApi = ServiceApi();
  static final _streamApi = ServiceStreamApi();
  static final _searchApi = ServiceSearchApi();
  static final _channelApi = ServiceChannelApi();
  static final _playlistApi = ServicePlaylistApi();
  static final _kioskApi = ServiceKioskApi();

  // ─── Services ────────────────────────────────────────

  static Future<List<ServiceInfo>> getAvailableServices() async {
    final dtos = await _serviceApi.getAvailableServices();
    return dtos.whereType<ServiceInfoDto>().map(m.mapServiceInfo).toList();
  }

  // ─── Streams ─────────────────────────────────────────

  static Future<VideoInfo> getStreamInfo(int serviceId, String url) async {
    final dto = await withReCaptchaRetry(() => _streamApi.getStreamInfo(serviceId, url));
    return m.mapVideoInfo(dto);
  }

  static Future<YoutubeVideo> getStream(int serviceId, String url) async {
    final info = await withReCaptchaRetry(() => _streamApi.getStreamInfo(serviceId, url));
    final streams = await withReCaptchaRetry(() => _streamApi.getStreams(serviceId, url));
    return m.mapYoutubeVideo(info, streams);
  }

  static Future<SearchResult> getRelatedItems(int serviceId, String url) async {
    final dto = await withReCaptchaRetry(() => _streamApi.getRelatedItems(serviceId, url));
    return m.mapSearchResult(dto);
  }

  // ─── Search ──────────────────────────────────────────

  static Future<SearchResult> search(int serviceId, String query, List<String> filters) async {
    final dto = await withReCaptchaRetry(() => _searchApi.search(serviceId, query, filters));
    return m.mapSearchResult(dto);
  }

  static Future<SearchResult> searchNextPage(int serviceId) async {
    final dto = await withReCaptchaRetry(() => _searchApi.searchNextPage(serviceId));
    return m.mapSearchResult(dto);
  }

  static Future<List<String>> getSuggestions(int serviceId, String query) async {
    final result = await _searchApi.getSuggestions(serviceId, query);
    return result.whereType<String>().toList();
  }

  // ─── Channels ────────────────────────────────────────

  static Future<YoutubeChannel> getChannelInfo(int serviceId, String url) async {
    final dto = await withReCaptchaRetry(() => _channelApi.getChannelInfo(serviceId, url));
    return m.mapChannel(dto);
  }

  static Future<List<StreamInfoItem>> getChannelContent(int serviceId, String url) async {
    final dtos = await withReCaptchaRetry(() => _channelApi.getChannelContent(serviceId, url));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  static Future<List<StreamInfoItem>> getChannelContentNextPage(int serviceId) async {
    final dtos = await withReCaptchaRetry(() => _channelApi.getChannelContentNextPage(serviceId));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  // ─── Playlists ───────────────────────────────────────

  static Future<YoutubePlaylist> getPlaylistInfo(int serviceId, String url) async {
    final dto = await withReCaptchaRetry(() => _playlistApi.getPlaylistInfo(serviceId, url));
    return m.mapPlaylist(dto);
  }

  static Future<List<StreamInfoItem>> getPlaylistContent(int serviceId, String url) async {
    final dtos = await withReCaptchaRetry(() => _playlistApi.getPlaylistContent(serviceId, url));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  static Future<List<StreamInfoItem>> getPlaylistContentNextPage(int serviceId) async {
    final dtos = await withReCaptchaRetry(() => _playlistApi.getPlaylistContentNextPage(serviceId));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  // ─── Kiosks ──────────────────────────────────────────

  static Future<List<String>> listKiosks(int serviceId) async {
    final result = await _kioskApi.listServiceKiosks(serviceId);
    return result.whereType<String>().toList();
  }

  static Future<List<StreamInfoItem>> getKioskContent(int serviceId, String kioskId) async {
    final dtos = await withReCaptchaRetry(() => _kioskApi.getServiceKioskContent(serviceId, kioskId));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }
}
