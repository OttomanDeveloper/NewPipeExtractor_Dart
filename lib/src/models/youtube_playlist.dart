import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newpipeextractor_dart/src/models/enums.dart';
part 'youtube_playlist.freezed.dart';
part 'youtube_playlist.g.dart';

/// YouTube playlist with metadata, thumbnail URLs, and playlist type classification.
@freezed
class YoutubePlaylist with _$YoutubePlaylist {
  const factory YoutubePlaylist({
    String? id,
    String? name,
    String? url,
    String? uploaderName,
    @Default([]) List<String> uploaderAvatars,
    String? uploaderUrl,
    @Default([]) List<String> banners,
    @Default([]) List<String> thumbnails,
    @Default(0) int streamCount,
    String? description,
    @Default(PlaylistType.normal) PlaylistType playlistType,
  }) = _YoutubePlaylist;

  factory YoutubePlaylist.fromJson(Map<String, dynamic> json) =>
      _$YoutubePlaylistFromJson(json);
}
