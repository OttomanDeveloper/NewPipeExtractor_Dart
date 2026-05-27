import 'package:newpipeextractor_dart/src/generated/extractor_api.g.dart';
import 'package:newpipeextractor_dart/src/extractors/dto_mapper.dart' as m;
import 'package:newpipeextractor_dart/src/models/youtube_playlist.dart';
import 'package:newpipeextractor_dart/src/models/stream_info_item.dart';
import 'package:newpipeextractor_dart/src/utils/recaptcha_helper.dart';

class PlaylistExtractor {
  static final _api = PlaylistApi();

  static Future<YoutubePlaylist> getPlaylistDetails(String url) async {
    final dto = await withReCaptchaRetry(() => _api.getPlaylistDetails(url));
    return m.mapPlaylist(dto);
  }

  static Future<List<StreamInfoItem>> getPlaylistStreams(String url) async {
    final dtos = await withReCaptchaRetry(() => _api.getPlaylistStreams(url));
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }

  static Future<List<StreamInfoItem>> getPlaylistNextPage() async {
    final dtos = await withReCaptchaRetry(() => _api.getPlaylistNextPage());
    return dtos.whereType<StreamInfoItemDto>().map(m.mapStreamInfoItem).toList();
  }
}
