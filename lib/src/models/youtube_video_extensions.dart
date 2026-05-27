import 'package:newpipeextractor_dart/src/models/youtube_video.dart';
import 'package:newpipeextractor_dart/src/models/streams/audio_only_stream.dart';
import 'package:newpipeextractor_dart/src/models/streams/video_only_stream.dart';
import 'package:newpipeextractor_dart/src/models/streams/video_stream.dart';

/// Convenience getters for selecting the best quality streams from a [YoutubeVideo].
extension YoutubeVideoHelpers on YoutubeVideo {
  /// Returns the highest resolution video-only stream, or null if empty.
  VideoOnlyStream? get videoOnlyWithHighestQuality {
    if (videoOnlyStreams.isEmpty) return null;
    return videoOnlyStreams.reduce((a, b) {
      final aRes = int.tryParse(a.resolution?.split('p').first ?? '0') ?? 0;
      final bRes = int.tryParse(b.resolution?.split('p').first ?? '0') ?? 0;
      return aRes >= bRes ? a : b;
    });
  }

  /// Returns the highest resolution muxed stream (capped at 720p), or null if empty.
  VideoStream? get videoWithHighestQuality {
    if (videoStreams.isEmpty) return null;
    return videoStreams.reduce((a, b) {
      final aRes = int.tryParse(a.resolution?.split('p').first ?? '0') ?? 0;
      final bRes = int.tryParse(b.resolution?.split('p').first ?? '0') ?? 0;
      return aRes >= bRes ? a : b;
    });
  }

  /// Returns the highest bitrate audio stream regardless of format, or null if empty.
  AudioOnlyStream? get audioWithHighestQuality {
    if (audioOnlyStreams.isEmpty) return null;
    return audioOnlyStreams.reduce((a, b) =>
        a.averageBitrate >= b.averageBitrate ? a : b);
  }

  /// Returns the highest bitrate AAC (m4a) audio stream. Falls back to [audioWithHighestQuality].
  AudioOnlyStream? get audioWithBestAacQuality {
    final aacStreams = audioOnlyStreams.where((s) => s.formatSuffix == 'm4a').toList();
    if (aacStreams.isEmpty) return audioWithHighestQuality;
    return aacStreams.reduce((a, b) =>
        a.averageBitrate >= b.averageBitrate ? a : b);
  }

  /// Returns the highest bitrate OGG (webm) audio stream. Falls back to [audioWithHighestQuality].
  AudioOnlyStream? get audioWithBestOggQuality {
    final oggStreams = audioOnlyStreams.where((s) => s.formatSuffix == 'webm').toList();
    if (oggStreams.isEmpty) return audioWithHighestQuality;
    return oggStreams.reduce((a, b) =>
        a.averageBitrate >= b.averageBitrate ? a : b);
  }

  /// Returns the best audio format matching a video-only stream's container (AAC for MP4, OGG for WebM).
  AudioOnlyStream? bestAudioForVideo(VideoOnlyStream stream) => switch (stream.formatSuffix) {
    'mp4' => audioWithBestAacQuality,
    'webm' => audioWithBestOggQuality,
    _ => null,
  };
}
