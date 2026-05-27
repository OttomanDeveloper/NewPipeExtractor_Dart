/// Identifies the type of media stream.
enum StreamType {
  videoStream,
  audioStream,
  liveStream,
  audioLiveStream,
  postLiveStream,
  none;

  static StreamType fromString(String? value) => switch (value) {
    'VIDEO_STREAM' => StreamType.videoStream,
    'AUDIO_STREAM' => StreamType.audioStream,
    'LIVE_STREAM' => StreamType.liveStream,
    'AUDIO_LIVE_STREAM' => StreamType.audioLiveStream,
    'POST_LIVE_STREAM' => StreamType.postLiveStream,
    _ => StreamType.none,
  };
}

/// Classifies the playlist origin.
enum PlaylistType {
  normal,
  mixStream,
  mixChannel,
  mixAlbum;

  static PlaylistType fromString(String? value) => switch (value) {
    'MIX_STREAM' => PlaylistType.mixStream,
    'MIX_CHANNEL' => PlaylistType.mixChannel,
    'MIX_ALBUM' => PlaylistType.mixAlbum,
    _ => PlaylistType.normal,
  };
}

/// Video privacy status.
enum Privacy {
  public_,
  unlisted,
  private_,
  internal_,
  other;

  static Privacy fromString(String? value) => switch (value) {
    'PUBLIC' => Privacy.public_,
    'UNLISTED' => Privacy.unlisted,
    'PRIVATE' => Privacy.private_,
    'INTERNAL' => Privacy.internal_,
    _ => Privacy.other,
  };
}

/// Available channel tabs for browsing channel content.
enum ChannelTab {
  videos,
  shorts,
  live,
  playlists,
  channels,
  albums;

  static ChannelTab? fromString(String? value) => switch (value) {
    'videos' => ChannelTab.videos,
    'shorts' => ChannelTab.shorts,
    'livestreams' => ChannelTab.live,
    'playlists' => ChannelTab.playlists,
    'channels' => ChannelTab.channels,
    'albums' => ChannelTab.albums,
    _ => null,
  };
}

/// Search content type filters for YouTube and YouTube Music.
enum SearchFilter {
  all('all'),
  videos('videos'),
  channels('channels'),
  playlists('playlists'),
  musicSongs('music_songs'),
  musicVideos('music_videos'),
  musicAlbums('music_albums'),
  musicPlaylists('music_playlists'),
  musicArtists('music_artists');

  final String value;
  const SearchFilter(this.value);
}

/// NewPipe Extractor service identifiers.
enum ServiceId {
  youtube(0),
  soundCloud(1),
  mediaCccDe(2),
  peerTube(3),
  bandcamp(4);

  final int value;
  const ServiceId(this.value);
}
