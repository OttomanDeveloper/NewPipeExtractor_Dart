// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YoutubeVideo _$YoutubeVideoFromJson(Map<String, dynamic> json) {
  return _YoutubeVideo.fromJson(json);
}

/// @nodoc
mixin _$YoutubeVideo {
  VideoInfo get videoInfo => throw _privateConstructorUsedError;
  List<AudioOnlyStream> get audioOnlyStreams =>
      throw _privateConstructorUsedError;
  List<VideoOnlyStream> get videoOnlyStreams =>
      throw _privateConstructorUsedError;
  List<VideoStream> get videoStreams => throw _privateConstructorUsedError;
  List<SubtitleStream> get subtitleStreams =>
      throw _privateConstructorUsedError;
  List<StreamSegment> get segments => throw _privateConstructorUsedError;
  List<Frameset> get framesets => throw _privateConstructorUsedError;

  /// Serializes this YoutubeVideo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YoutubeVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YoutubeVideoCopyWith<YoutubeVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeVideoCopyWith<$Res> {
  factory $YoutubeVideoCopyWith(
          YoutubeVideo value, $Res Function(YoutubeVideo) then) =
      _$YoutubeVideoCopyWithImpl<$Res, YoutubeVideo>;
  @useResult
  $Res call(
      {VideoInfo videoInfo,
      List<AudioOnlyStream> audioOnlyStreams,
      List<VideoOnlyStream> videoOnlyStreams,
      List<VideoStream> videoStreams,
      List<SubtitleStream> subtitleStreams,
      List<StreamSegment> segments,
      List<Frameset> framesets});

  $VideoInfoCopyWith<$Res> get videoInfo;
}

/// @nodoc
class _$YoutubeVideoCopyWithImpl<$Res, $Val extends YoutubeVideo>
    implements $YoutubeVideoCopyWith<$Res> {
  _$YoutubeVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubeVideo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoInfo = null,
    Object? audioOnlyStreams = null,
    Object? videoOnlyStreams = null,
    Object? videoStreams = null,
    Object? subtitleStreams = null,
    Object? segments = null,
    Object? framesets = null,
  }) {
    return _then(_value.copyWith(
      videoInfo: null == videoInfo
          ? _value.videoInfo
          : videoInfo // ignore: cast_nullable_to_non_nullable
              as VideoInfo,
      audioOnlyStreams: null == audioOnlyStreams
          ? _value.audioOnlyStreams
          : audioOnlyStreams // ignore: cast_nullable_to_non_nullable
              as List<AudioOnlyStream>,
      videoOnlyStreams: null == videoOnlyStreams
          ? _value.videoOnlyStreams
          : videoOnlyStreams // ignore: cast_nullable_to_non_nullable
              as List<VideoOnlyStream>,
      videoStreams: null == videoStreams
          ? _value.videoStreams
          : videoStreams // ignore: cast_nullable_to_non_nullable
              as List<VideoStream>,
      subtitleStreams: null == subtitleStreams
          ? _value.subtitleStreams
          : subtitleStreams // ignore: cast_nullable_to_non_nullable
              as List<SubtitleStream>,
      segments: null == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<StreamSegment>,
      framesets: null == framesets
          ? _value.framesets
          : framesets // ignore: cast_nullable_to_non_nullable
              as List<Frameset>,
    ) as $Val);
  }

  /// Create a copy of YoutubeVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoInfoCopyWith<$Res> get videoInfo {
    return $VideoInfoCopyWith<$Res>(_value.videoInfo, (value) {
      return _then(_value.copyWith(videoInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$YoutubeVideoImplCopyWith<$Res>
    implements $YoutubeVideoCopyWith<$Res> {
  factory _$$YoutubeVideoImplCopyWith(
          _$YoutubeVideoImpl value, $Res Function(_$YoutubeVideoImpl) then) =
      __$$YoutubeVideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VideoInfo videoInfo,
      List<AudioOnlyStream> audioOnlyStreams,
      List<VideoOnlyStream> videoOnlyStreams,
      List<VideoStream> videoStreams,
      List<SubtitleStream> subtitleStreams,
      List<StreamSegment> segments,
      List<Frameset> framesets});

  @override
  $VideoInfoCopyWith<$Res> get videoInfo;
}

/// @nodoc
class __$$YoutubeVideoImplCopyWithImpl<$Res>
    extends _$YoutubeVideoCopyWithImpl<$Res, _$YoutubeVideoImpl>
    implements _$$YoutubeVideoImplCopyWith<$Res> {
  __$$YoutubeVideoImplCopyWithImpl(
      _$YoutubeVideoImpl _value, $Res Function(_$YoutubeVideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubeVideo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoInfo = null,
    Object? audioOnlyStreams = null,
    Object? videoOnlyStreams = null,
    Object? videoStreams = null,
    Object? subtitleStreams = null,
    Object? segments = null,
    Object? framesets = null,
  }) {
    return _then(_$YoutubeVideoImpl(
      videoInfo: null == videoInfo
          ? _value.videoInfo
          : videoInfo // ignore: cast_nullable_to_non_nullable
              as VideoInfo,
      audioOnlyStreams: null == audioOnlyStreams
          ? _value._audioOnlyStreams
          : audioOnlyStreams // ignore: cast_nullable_to_non_nullable
              as List<AudioOnlyStream>,
      videoOnlyStreams: null == videoOnlyStreams
          ? _value._videoOnlyStreams
          : videoOnlyStreams // ignore: cast_nullable_to_non_nullable
              as List<VideoOnlyStream>,
      videoStreams: null == videoStreams
          ? _value._videoStreams
          : videoStreams // ignore: cast_nullable_to_non_nullable
              as List<VideoStream>,
      subtitleStreams: null == subtitleStreams
          ? _value._subtitleStreams
          : subtitleStreams // ignore: cast_nullable_to_non_nullable
              as List<SubtitleStream>,
      segments: null == segments
          ? _value._segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<StreamSegment>,
      framesets: null == framesets
          ? _value._framesets
          : framesets // ignore: cast_nullable_to_non_nullable
              as List<Frameset>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YoutubeVideoImpl implements _YoutubeVideo {
  const _$YoutubeVideoImpl(
      {required this.videoInfo,
      final List<AudioOnlyStream> audioOnlyStreams = const [],
      final List<VideoOnlyStream> videoOnlyStreams = const [],
      final List<VideoStream> videoStreams = const [],
      final List<SubtitleStream> subtitleStreams = const [],
      final List<StreamSegment> segments = const [],
      final List<Frameset> framesets = const []})
      : _audioOnlyStreams = audioOnlyStreams,
        _videoOnlyStreams = videoOnlyStreams,
        _videoStreams = videoStreams,
        _subtitleStreams = subtitleStreams,
        _segments = segments,
        _framesets = framesets;

  factory _$YoutubeVideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$YoutubeVideoImplFromJson(json);

  @override
  final VideoInfo videoInfo;
  final List<AudioOnlyStream> _audioOnlyStreams;
  @override
  @JsonKey()
  List<AudioOnlyStream> get audioOnlyStreams {
    if (_audioOnlyStreams is EqualUnmodifiableListView)
      return _audioOnlyStreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audioOnlyStreams);
  }

  final List<VideoOnlyStream> _videoOnlyStreams;
  @override
  @JsonKey()
  List<VideoOnlyStream> get videoOnlyStreams {
    if (_videoOnlyStreams is EqualUnmodifiableListView)
      return _videoOnlyStreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoOnlyStreams);
  }

  final List<VideoStream> _videoStreams;
  @override
  @JsonKey()
  List<VideoStream> get videoStreams {
    if (_videoStreams is EqualUnmodifiableListView) return _videoStreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoStreams);
  }

  final List<SubtitleStream> _subtitleStreams;
  @override
  @JsonKey()
  List<SubtitleStream> get subtitleStreams {
    if (_subtitleStreams is EqualUnmodifiableListView) return _subtitleStreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtitleStreams);
  }

  final List<StreamSegment> _segments;
  @override
  @JsonKey()
  List<StreamSegment> get segments {
    if (_segments is EqualUnmodifiableListView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_segments);
  }

  final List<Frameset> _framesets;
  @override
  @JsonKey()
  List<Frameset> get framesets {
    if (_framesets is EqualUnmodifiableListView) return _framesets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_framesets);
  }

  @override
  String toString() {
    return 'YoutubeVideo(videoInfo: $videoInfo, audioOnlyStreams: $audioOnlyStreams, videoOnlyStreams: $videoOnlyStreams, videoStreams: $videoStreams, subtitleStreams: $subtitleStreams, segments: $segments, framesets: $framesets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoutubeVideoImpl &&
            (identical(other.videoInfo, videoInfo) ||
                other.videoInfo == videoInfo) &&
            const DeepCollectionEquality()
                .equals(other._audioOnlyStreams, _audioOnlyStreams) &&
            const DeepCollectionEquality()
                .equals(other._videoOnlyStreams, _videoOnlyStreams) &&
            const DeepCollectionEquality()
                .equals(other._videoStreams, _videoStreams) &&
            const DeepCollectionEquality()
                .equals(other._subtitleStreams, _subtitleStreams) &&
            const DeepCollectionEquality().equals(other._segments, _segments) &&
            const DeepCollectionEquality()
                .equals(other._framesets, _framesets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoInfo,
      const DeepCollectionEquality().hash(_audioOnlyStreams),
      const DeepCollectionEquality().hash(_videoOnlyStreams),
      const DeepCollectionEquality().hash(_videoStreams),
      const DeepCollectionEquality().hash(_subtitleStreams),
      const DeepCollectionEquality().hash(_segments),
      const DeepCollectionEquality().hash(_framesets));

  /// Create a copy of YoutubeVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YoutubeVideoImplCopyWith<_$YoutubeVideoImpl> get copyWith =>
      __$$YoutubeVideoImplCopyWithImpl<_$YoutubeVideoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YoutubeVideoImplToJson(
      this,
    );
  }
}

abstract class _YoutubeVideo implements YoutubeVideo {
  const factory _YoutubeVideo(
      {required final VideoInfo videoInfo,
      final List<AudioOnlyStream> audioOnlyStreams,
      final List<VideoOnlyStream> videoOnlyStreams,
      final List<VideoStream> videoStreams,
      final List<SubtitleStream> subtitleStreams,
      final List<StreamSegment> segments,
      final List<Frameset> framesets}) = _$YoutubeVideoImpl;

  factory _YoutubeVideo.fromJson(Map<String, dynamic> json) =
      _$YoutubeVideoImpl.fromJson;

  @override
  VideoInfo get videoInfo;
  @override
  List<AudioOnlyStream> get audioOnlyStreams;
  @override
  List<VideoOnlyStream> get videoOnlyStreams;
  @override
  List<VideoStream> get videoStreams;
  @override
  List<SubtitleStream> get subtitleStreams;
  @override
  List<StreamSegment> get segments;
  @override
  List<Frameset> get framesets;

  /// Create a copy of YoutubeVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YoutubeVideoImplCopyWith<_$YoutubeVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
