import 'package:newpipeextractor_dart/src/models/youtube_video.dart';
import 'package:newpipeextractor_dart/src/models/streams/audio_only_stream.dart';
import 'package:newpipeextractor_dart/src/models/streams/video_only_stream.dart';
import 'package:newpipeextractor_dart/src/models/streams/video_stream.dart';

extension YoutubeVideoHelpers on YoutubeVideo {
  VideoOnlyStream? get videoOnlyWithHighestQuality {
    if (videoOnlyStreams.isEmpty) return null;
    return videoOnlyStreams.reduce((a, b) {
      final aRes = int.tryParse(a.resolution?.split('p').first ?? '0') ?? 0;
      final bRes = int.tryParse(b.resolution?.split('p').first ?? '0') ?? 0;
      return aRes >= bRes ? a : b;
    });
  }

  VideoStream? get videoWithHighestQuality {
    if (videoStreams.isEmpty) return null;
    return videoStreams.reduce((a, b) {
      final aRes = int.tryParse(a.resolution?.split('p').first ?? '0') ?? 0;
      final bRes = int.tryParse(b.resolution?.split('p').first ?? '0') ?? 0;
      return aRes >= bRes ? a : b;
    });
  }

  AudioOnlyStream? get audioWithHighestQuality {
    if (audioOnlyStreams.isEmpty) return null;
    return audioOnlyStreams.reduce((a, b) =>
        a.averageBitrate >= b.averageBitrate ? a : b);
  }

  AudioOnlyStream? get audioWithBestAacQuality {
    final aacStreams = audioOnlyStreams.where((s) => s.formatName == 'm4a').toList();
    if (aacStreams.isEmpty) return audioWithHighestQuality;
    return aacStreams.reduce((a, b) =>
        a.averageBitrate >= b.averageBitrate ? a : b);
  }

  AudioOnlyStream? get audioWithBestOggQuality {
    final oggStreams = audioOnlyStreams.where((s) => s.formatName == 'webm').toList();
    if (oggStreams.isEmpty) return audioWithHighestQuality;
    return oggStreams.reduce((a, b) =>
        a.averageBitrate >= b.averageBitrate ? a : b);
  }

  AudioOnlyStream? bestAudioForVideo(VideoOnlyStream stream) => switch (stream.formatSuffix) {
    'mp4' => audioWithBestAacQuality,
    'webm' => audioWithBestOggQuality,
    _ => null,
  };
}
