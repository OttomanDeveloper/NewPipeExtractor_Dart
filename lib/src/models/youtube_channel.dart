import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newpipeextractor_dart/src/models/enums.dart';
part 'youtube_channel.freezed.dart';
part 'youtube_channel.g.dart';

/// YouTube channel metadata with subscriber count, verified status, and available tabs.
@freezed
class YoutubeChannel with _$YoutubeChannel {
  const factory YoutubeChannel({
    String? id,
    String? name,
    String? url,
    @Default([]) List<String> avatars,
    @Default([]) List<String> banners,
    String? description,
    String? feedUrl,
    int? subscriberCount,
    @Default(false) bool isVerified,
    @Default([]) List<ChannelTab> tabs,
  }) = _YoutubeChannel;

  factory YoutubeChannel.fromJson(Map<String, dynamic> json) =>
      _$YoutubeChannelFromJson(json);
}
