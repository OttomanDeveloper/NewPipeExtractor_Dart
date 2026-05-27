import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newpipeextractor_dart/src/models/video_info.dart';
import 'package:newpipeextractor_dart/src/models/streams/audio_only_stream.dart';
import 'package:newpipeextractor_dart/src/models/streams/video_only_stream.dart';
import 'package:newpipeextractor_dart/src/models/streams/video_stream.dart';
import 'package:newpipeextractor_dart/src/models/streams/subtitle_stream.dart';
import 'package:newpipeextractor_dart/src/models/stream_segment.dart';
import 'package:newpipeextractor_dart/src/models/frameset.dart';
part 'youtube_video.freezed.dart';
part 'youtube_video.g.dart';

/// Complete video with metadata, media streams, subtitles, chapters, and storyboard frames.
@freezed
class YoutubeVideo with _$YoutubeVideo {
  const factory YoutubeVideo({
    required VideoInfo videoInfo,
    @Default([]) List<AudioOnlyStream> audioOnlyStreams,
    @Default([]) List<VideoOnlyStream> videoOnlyStreams,
    @Default([]) List<VideoStream> videoStreams,
    @Default([]) List<SubtitleStream> subtitleStreams,
    @Default([]) List<StreamSegment> segments,
    @Default([]) List<Frameset> framesets,
  }) = _YoutubeVideo;

  factory YoutubeVideo.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoFromJson(json);
}
