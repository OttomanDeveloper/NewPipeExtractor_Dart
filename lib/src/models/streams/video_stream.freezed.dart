// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_stream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoStream _$VideoStreamFromJson(Map<String, dynamic> json) {
  return _VideoStream.fromJson(json);
}

/// @nodoc
mixin _$VideoStream {
  String? get url => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  int get fps => throw _privateConstructorUsedError;
  String? get formatName => throw _privateConstructorUsedError;
  String? get formatSuffix => throw _privateConstructorUsedError;
  String? get formatMimeType => throw _privateConstructorUsedError;

  /// Serializes this VideoStream to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoStream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoStreamCopyWith<VideoStream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoStreamCopyWith<$Res> {
  factory $VideoStreamCopyWith(
          VideoStream value, $Res Function(VideoStream) then) =
      _$VideoStreamCopyWithImpl<$Res, VideoStream>;
  @useResult
  $Res call(
      {String? url,
      String? resolution,
      int fps,
      String? formatName,
      String? formatSuffix,
      String? formatMimeType});
}

/// @nodoc
class _$VideoStreamCopyWithImpl<$Res, $Val extends VideoStream>
    implements $VideoStreamCopyWith<$Res> {
  _$VideoStreamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoStream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? resolution = freezed,
    Object? fps = null,
    Object? formatName = freezed,
    Object? formatSuffix = freezed,
    Object? formatMimeType = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      fps: null == fps
          ? _value.fps
          : fps // ignore: cast_nullable_to_non_nullable
              as int,
      formatName: freezed == formatName
          ? _value.formatName
          : formatName // ignore: cast_nullable_to_non_nullable
              as String?,
      formatSuffix: freezed == formatSuffix
          ? _value.formatSuffix
          : formatSuffix // ignore: cast_nullable_to_non_nullable
              as String?,
      formatMimeType: freezed == formatMimeType
          ? _value.formatMimeType
          : formatMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoStreamImplCopyWith<$Res>
    implements $VideoStreamCopyWith<$Res> {
  factory _$$VideoStreamImplCopyWith(
          _$VideoStreamImpl value, $Res Function(_$VideoStreamImpl) then) =
      __$$VideoStreamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      String? resolution,
      int fps,
      String? formatName,
      String? formatSuffix,
      String? formatMimeType});
}

/// @nodoc
class __$$VideoStreamImplCopyWithImpl<$Res>
    extends _$VideoStreamCopyWithImpl<$Res, _$VideoStreamImpl>
    implements _$$VideoStreamImplCopyWith<$Res> {
  __$$VideoStreamImplCopyWithImpl(
      _$VideoStreamImpl _value, $Res Function(_$VideoStreamImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoStream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? resolution = freezed,
    Object? fps = null,
    Object? formatName = freezed,
    Object? formatSuffix = freezed,
    Object? formatMimeType = freezed,
  }) {
    return _then(_$VideoStreamImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      fps: null == fps
          ? _value.fps
          : fps // ignore: cast_nullable_to_non_nullable
              as int,
      formatName: freezed == formatName
          ? _value.formatName
          : formatName // ignore: cast_nullable_to_non_nullable
              as String?,
      formatSuffix: freezed == formatSuffix
          ? _value.formatSuffix
          : formatSuffix // ignore: cast_nullable_to_non_nullable
              as String?,
      formatMimeType: freezed == formatMimeType
          ? _value.formatMimeType
          : formatMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoStreamImpl implements _VideoStream {
  const _$VideoStreamImpl(
      {this.url,
      this.resolution,
      this.fps = 0,
      this.formatName,
      this.formatSuffix,
      this.formatMimeType});

  factory _$VideoStreamImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoStreamImplFromJson(json);

  @override
  final String? url;
  @override
  final String? resolution;
  @override
  @JsonKey()
  final int fps;
  @override
  final String? formatName;
  @override
  final String? formatSuffix;
  @override
  final String? formatMimeType;

  @override
  String toString() {
    return 'VideoStream(url: $url, resolution: $resolution, fps: $fps, formatName: $formatName, formatSuffix: $formatSuffix, formatMimeType: $formatMimeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoStreamImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.fps, fps) || other.fps == fps) &&
            (identical(other.formatName, formatName) ||
                other.formatName == formatName) &&
            (identical(other.formatSuffix, formatSuffix) ||
                other.formatSuffix == formatSuffix) &&
            (identical(other.formatMimeType, formatMimeType) ||
                other.formatMimeType == formatMimeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, resolution, fps, formatName,
      formatSuffix, formatMimeType);

  /// Create a copy of VideoStream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoStreamImplCopyWith<_$VideoStreamImpl> get copyWith =>
      __$$VideoStreamImplCopyWithImpl<_$VideoStreamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoStreamImplToJson(
      this,
    );
  }
}

abstract class _VideoStream implements VideoStream {
  const factory _VideoStream(
      {final String? url,
      final String? resolution,
      final int fps,
      final String? formatName,
      final String? formatSuffix,
      final String? formatMimeType}) = _$VideoStreamImpl;

  factory _VideoStream.fromJson(Map<String, dynamic> json) =
      _$VideoStreamImpl.fromJson;

  @override
  String? get url;
  @override
  String? get resolution;
  @override
  int get fps;
  @override
  String? get formatName;
  @override
  String? get formatSuffix;
  @override
  String? get formatMimeType;

  /// Create a copy of VideoStream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoStreamImplCopyWith<_$VideoStreamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
