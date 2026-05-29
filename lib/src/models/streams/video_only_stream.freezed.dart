// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_only_stream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoOnlyStream _$VideoOnlyStreamFromJson(Map<String, dynamic> json) {
  return _VideoOnlyStream.fromJson(json);
}

/// @nodoc
mixin _$VideoOnlyStream {
  String? get url => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;

  /// Frames per second.
  int get fps => throw _privateConstructorUsedError;
  String? get formatName => throw _privateConstructorUsedError;
  String? get formatSuffix => throw _privateConstructorUsedError;
  String? get formatMimeType => throw _privateConstructorUsedError;

  /// Serializes this VideoOnlyStream to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoOnlyStream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoOnlyStreamCopyWith<VideoOnlyStream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoOnlyStreamCopyWith<$Res> {
  factory $VideoOnlyStreamCopyWith(
          VideoOnlyStream value, $Res Function(VideoOnlyStream) then) =
      _$VideoOnlyStreamCopyWithImpl<$Res, VideoOnlyStream>;
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
class _$VideoOnlyStreamCopyWithImpl<$Res, $Val extends VideoOnlyStream>
    implements $VideoOnlyStreamCopyWith<$Res> {
  _$VideoOnlyStreamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoOnlyStream
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
abstract class _$$VideoOnlyStreamImplCopyWith<$Res>
    implements $VideoOnlyStreamCopyWith<$Res> {
  factory _$$VideoOnlyStreamImplCopyWith(_$VideoOnlyStreamImpl value,
          $Res Function(_$VideoOnlyStreamImpl) then) =
      __$$VideoOnlyStreamImplCopyWithImpl<$Res>;
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
class __$$VideoOnlyStreamImplCopyWithImpl<$Res>
    extends _$VideoOnlyStreamCopyWithImpl<$Res, _$VideoOnlyStreamImpl>
    implements _$$VideoOnlyStreamImplCopyWith<$Res> {
  __$$VideoOnlyStreamImplCopyWithImpl(
      _$VideoOnlyStreamImpl _value, $Res Function(_$VideoOnlyStreamImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoOnlyStream
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
    return _then(_$VideoOnlyStreamImpl(
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
class _$VideoOnlyStreamImpl implements _VideoOnlyStream {
  const _$VideoOnlyStreamImpl(
      {this.url,
      this.resolution,
      this.fps = 0,
      this.formatName,
      this.formatSuffix,
      this.formatMimeType});

  factory _$VideoOnlyStreamImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoOnlyStreamImplFromJson(json);

  @override
  final String? url;
  @override
  final String? resolution;

  /// Frames per second.
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
    return 'VideoOnlyStream(url: $url, resolution: $resolution, fps: $fps, formatName: $formatName, formatSuffix: $formatSuffix, formatMimeType: $formatMimeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoOnlyStreamImpl &&
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

  /// Create a copy of VideoOnlyStream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoOnlyStreamImplCopyWith<_$VideoOnlyStreamImpl> get copyWith =>
      __$$VideoOnlyStreamImplCopyWithImpl<_$VideoOnlyStreamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoOnlyStreamImplToJson(
      this,
    );
  }
}

abstract class _VideoOnlyStream implements VideoOnlyStream {
  const factory _VideoOnlyStream(
      {final String? url,
      final String? resolution,
      final int fps,
      final String? formatName,
      final String? formatSuffix,
      final String? formatMimeType}) = _$VideoOnlyStreamImpl;

  factory _VideoOnlyStream.fromJson(Map<String, dynamic> json) =
      _$VideoOnlyStreamImpl.fromJson;

  @override
  String? get url;
  @override
  String? get resolution;

  /// Frames per second.
  @override
  int get fps;
  @override
  String? get formatName;
  @override
  String? get formatSuffix;
  @override
  String? get formatMimeType;

  /// Create a copy of VideoOnlyStream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoOnlyStreamImplCopyWith<_$VideoOnlyStreamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
