// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_only_stream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AudioOnlyStream _$AudioOnlyStreamFromJson(Map<String, dynamic> json) {
  return _AudioOnlyStream.fromJson(json);
}

/// @nodoc
mixin _$AudioOnlyStream {
  String? get url => throw _privateConstructorUsedError;

  /// Bitrate in kbps.
  int get averageBitrate => throw _privateConstructorUsedError;
  String? get formatName => throw _privateConstructorUsedError;
  String? get formatSuffix => throw _privateConstructorUsedError;
  String? get formatMimeType => throw _privateConstructorUsedError;
  String? get audioTrackName => throw _privateConstructorUsedError;
  String? get audioTrackLocale => throw _privateConstructorUsedError;

  /// Audio track type: ORIGINAL, DUBBED, or DESCRIPTIVE.
  String? get audioTrackType => throw _privateConstructorUsedError;

  /// Serializes this AudioOnlyStream to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AudioOnlyStream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioOnlyStreamCopyWith<AudioOnlyStream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioOnlyStreamCopyWith<$Res> {
  factory $AudioOnlyStreamCopyWith(
          AudioOnlyStream value, $Res Function(AudioOnlyStream) then) =
      _$AudioOnlyStreamCopyWithImpl<$Res, AudioOnlyStream>;
  @useResult
  $Res call(
      {String? url,
      int averageBitrate,
      String? formatName,
      String? formatSuffix,
      String? formatMimeType,
      String? audioTrackName,
      String? audioTrackLocale,
      String? audioTrackType});
}

/// @nodoc
class _$AudioOnlyStreamCopyWithImpl<$Res, $Val extends AudioOnlyStream>
    implements $AudioOnlyStreamCopyWith<$Res> {
  _$AudioOnlyStreamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioOnlyStream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? averageBitrate = null,
    Object? formatName = freezed,
    Object? formatSuffix = freezed,
    Object? formatMimeType = freezed,
    Object? audioTrackName = freezed,
    Object? audioTrackLocale = freezed,
    Object? audioTrackType = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      averageBitrate: null == averageBitrate
          ? _value.averageBitrate
          : averageBitrate // ignore: cast_nullable_to_non_nullable
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
      audioTrackName: freezed == audioTrackName
          ? _value.audioTrackName
          : audioTrackName // ignore: cast_nullable_to_non_nullable
              as String?,
      audioTrackLocale: freezed == audioTrackLocale
          ? _value.audioTrackLocale
          : audioTrackLocale // ignore: cast_nullable_to_non_nullable
              as String?,
      audioTrackType: freezed == audioTrackType
          ? _value.audioTrackType
          : audioTrackType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioOnlyStreamImplCopyWith<$Res>
    implements $AudioOnlyStreamCopyWith<$Res> {
  factory _$$AudioOnlyStreamImplCopyWith(_$AudioOnlyStreamImpl value,
          $Res Function(_$AudioOnlyStreamImpl) then) =
      __$$AudioOnlyStreamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      int averageBitrate,
      String? formatName,
      String? formatSuffix,
      String? formatMimeType,
      String? audioTrackName,
      String? audioTrackLocale,
      String? audioTrackType});
}

/// @nodoc
class __$$AudioOnlyStreamImplCopyWithImpl<$Res>
    extends _$AudioOnlyStreamCopyWithImpl<$Res, _$AudioOnlyStreamImpl>
    implements _$$AudioOnlyStreamImplCopyWith<$Res> {
  __$$AudioOnlyStreamImplCopyWithImpl(
      _$AudioOnlyStreamImpl _value, $Res Function(_$AudioOnlyStreamImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioOnlyStream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? averageBitrate = null,
    Object? formatName = freezed,
    Object? formatSuffix = freezed,
    Object? formatMimeType = freezed,
    Object? audioTrackName = freezed,
    Object? audioTrackLocale = freezed,
    Object? audioTrackType = freezed,
  }) {
    return _then(_$AudioOnlyStreamImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      averageBitrate: null == averageBitrate
          ? _value.averageBitrate
          : averageBitrate // ignore: cast_nullable_to_non_nullable
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
      audioTrackName: freezed == audioTrackName
          ? _value.audioTrackName
          : audioTrackName // ignore: cast_nullable_to_non_nullable
              as String?,
      audioTrackLocale: freezed == audioTrackLocale
          ? _value.audioTrackLocale
          : audioTrackLocale // ignore: cast_nullable_to_non_nullable
              as String?,
      audioTrackType: freezed == audioTrackType
          ? _value.audioTrackType
          : audioTrackType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioOnlyStreamImpl implements _AudioOnlyStream {
  const _$AudioOnlyStreamImpl(
      {this.url,
      this.averageBitrate = 0,
      this.formatName,
      this.formatSuffix,
      this.formatMimeType,
      this.audioTrackName,
      this.audioTrackLocale,
      this.audioTrackType});

  factory _$AudioOnlyStreamImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioOnlyStreamImplFromJson(json);

  @override
  final String? url;

  /// Bitrate in kbps.
  @override
  @JsonKey()
  final int averageBitrate;
  @override
  final String? formatName;
  @override
  final String? formatSuffix;
  @override
  final String? formatMimeType;
  @override
  final String? audioTrackName;
  @override
  final String? audioTrackLocale;

  /// Audio track type: ORIGINAL, DUBBED, or DESCRIPTIVE.
  @override
  final String? audioTrackType;

  @override
  String toString() {
    return 'AudioOnlyStream(url: $url, averageBitrate: $averageBitrate, formatName: $formatName, formatSuffix: $formatSuffix, formatMimeType: $formatMimeType, audioTrackName: $audioTrackName, audioTrackLocale: $audioTrackLocale, audioTrackType: $audioTrackType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioOnlyStreamImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.averageBitrate, averageBitrate) ||
                other.averageBitrate == averageBitrate) &&
            (identical(other.formatName, formatName) ||
                other.formatName == formatName) &&
            (identical(other.formatSuffix, formatSuffix) ||
                other.formatSuffix == formatSuffix) &&
            (identical(other.formatMimeType, formatMimeType) ||
                other.formatMimeType == formatMimeType) &&
            (identical(other.audioTrackName, audioTrackName) ||
                other.audioTrackName == audioTrackName) &&
            (identical(other.audioTrackLocale, audioTrackLocale) ||
                other.audioTrackLocale == audioTrackLocale) &&
            (identical(other.audioTrackType, audioTrackType) ||
                other.audioTrackType == audioTrackType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      averageBitrate,
      formatName,
      formatSuffix,
      formatMimeType,
      audioTrackName,
      audioTrackLocale,
      audioTrackType);

  /// Create a copy of AudioOnlyStream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioOnlyStreamImplCopyWith<_$AudioOnlyStreamImpl> get copyWith =>
      __$$AudioOnlyStreamImplCopyWithImpl<_$AudioOnlyStreamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioOnlyStreamImplToJson(
      this,
    );
  }
}

abstract class _AudioOnlyStream implements AudioOnlyStream {
  const factory _AudioOnlyStream(
      {final String? url,
      final int averageBitrate,
      final String? formatName,
      final String? formatSuffix,
      final String? formatMimeType,
      final String? audioTrackName,
      final String? audioTrackLocale,
      final String? audioTrackType}) = _$AudioOnlyStreamImpl;

  factory _AudioOnlyStream.fromJson(Map<String, dynamic> json) =
      _$AudioOnlyStreamImpl.fromJson;

  @override
  String? get url;

  /// Bitrate in kbps.
  @override
  int get averageBitrate;
  @override
  String? get formatName;
  @override
  String? get formatSuffix;
  @override
  String? get formatMimeType;
  @override
  String? get audioTrackName;
  @override
  String? get audioTrackLocale;

  /// Audio track type: ORIGINAL, DUBBED, or DESCRIPTIVE.
  @override
  String? get audioTrackType;

  /// Create a copy of AudioOnlyStream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioOnlyStreamImplCopyWith<_$AudioOnlyStreamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
