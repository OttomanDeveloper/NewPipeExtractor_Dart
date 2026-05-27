import 'package:flutter_test/flutter_test.dart';
import 'package:newpipeextractor_dart/newpipeextractor_dart.dart';

void main() {
  group('StreamType', () {
    test('fromString maps known values', () {
      expect(StreamType.fromString('VIDEO_STREAM'), StreamType.videoStream);
      expect(StreamType.fromString('LIVE_STREAM'), StreamType.liveStream);
      expect(StreamType.fromString('AUDIO_LIVE_STREAM'), StreamType.audioLiveStream);
    });

    test('fromString returns none for unknown', () {
      expect(StreamType.fromString('UNKNOWN'), StreamType.none);
      expect(StreamType.fromString(null), StreamType.none);
    });
  });

  group('PlaylistType', () {
    test('fromString maps known values', () {
      expect(PlaylistType.fromString('MIX_STREAM'), PlaylistType.mixStream);
      expect(PlaylistType.fromString(null), PlaylistType.normal);
    });
  });

  group('ChannelTab', () {
    test('fromString maps known values', () {
      expect(ChannelTab.fromString('videos'), ChannelTab.videos);
      expect(ChannelTab.fromString('shorts'), ChannelTab.shorts);
      expect(ChannelTab.fromString('livestreams'), ChannelTab.live);
    });

    test('fromString returns null for unknown', () {
      expect(ChannelTab.fromString('unknown'), isNull);
    });
  });

  group('SearchFilter', () {
    test('has correct string values', () {
      expect(SearchFilter.videos.value, 'videos');
      expect(SearchFilter.musicSongs.value, 'music_songs');
    });
  });

  group('Privacy', () {
    test('fromString maps known values', () {
      expect(Privacy.fromString('PUBLIC'), Privacy.public_);
      expect(Privacy.fromString('UNLISTED'), Privacy.unlisted);
      expect(Privacy.fromString(null), Privacy.other);
    });
  });
}
