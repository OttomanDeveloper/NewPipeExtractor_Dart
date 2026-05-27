import 'package:flutter_test/flutter_test.dart';
import 'package:newpipeextractor_dart/newpipeextractor_dart.dart';

void main() {
  group('YoutubeVideoHelpers', () {
    test('videoOnlyWithHighestQuality picks highest resolution', () {
      final video = YoutubeVideo(
        videoInfo: const VideoInfo(),
        videoOnlyStreams: const [
          VideoOnlyStream(url: 'a', resolution: '720p'),
          VideoOnlyStream(url: 'b', resolution: '1080p'),
          VideoOnlyStream(url: 'c', resolution: '480p'),
        ],
      );
      expect(video.videoOnlyWithHighestQuality?.url, 'b');
    });

    test('audioWithHighestQuality picks highest bitrate', () {
      final video = YoutubeVideo(
        videoInfo: const VideoInfo(),
        audioOnlyStreams: const [
          AudioOnlyStream(url: 'a', averageBitrate: 128),
          AudioOnlyStream(url: 'b', averageBitrate: 256),
          AudioOnlyStream(url: 'c', averageBitrate: 192),
        ],
      );
      expect(video.audioWithHighestQuality?.url, 'b');
    });

    test('audioWithBestAacQuality filters m4a format', () {
      final video = YoutubeVideo(
        videoInfo: const VideoInfo(),
        audioOnlyStreams: const [
          AudioOnlyStream(url: 'a', averageBitrate: 256, formatName: 'webm'),
          AudioOnlyStream(url: 'b', averageBitrate: 128, formatName: 'm4a'),
          AudioOnlyStream(url: 'c', averageBitrate: 192, formatName: 'm4a'),
        ],
      );
      expect(video.audioWithBestAacQuality?.url, 'c');
    });

    test('bestAudioForVideo returns aac for mp4', () {
      final video = YoutubeVideo(
        videoInfo: const VideoInfo(),
        audioOnlyStreams: const [
          AudioOnlyStream(url: 'ogg', averageBitrate: 256, formatName: 'webm'),
          AudioOnlyStream(url: 'aac', averageBitrate: 128, formatName: 'm4a'),
        ],
      );
      const mp4Stream = VideoOnlyStream(url: 'v', formatSuffix: 'mp4');
      expect(video.bestAudioForVideo(mp4Stream)?.url, 'aac');
    });

    test('returns null for empty streams', () {
      const video = YoutubeVideo(videoInfo: VideoInfo());
      expect(video.videoOnlyWithHighestQuality, isNull);
      expect(video.audioWithHighestQuality, isNull);
    });
  });
}
