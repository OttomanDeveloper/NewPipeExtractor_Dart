import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newpipeextractor_dart/src/models/stream_info_item.dart';
import 'package:newpipeextractor_dart/src/models/channel_info_item.dart';
import 'package:newpipeextractor_dart/src/models/playlist_info_item.dart';
part 'search_result.freezed.dart';
part 'search_result.g.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    @Default([]) List<StreamInfoItem> videos,
    @Default([]) List<PlaylistInfoItem> playlists,
    @Default([]) List<ChannelInfoItem> channels,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
