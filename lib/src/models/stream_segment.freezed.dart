// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StreamSegment _$StreamSegmentFromJson(Map<String, dynamic> json) {
  return _StreamSegment.fromJson(json);
}

/// @nodoc
mixin _$StreamSegment {
  String? get url => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get previewUrl => throw _privateConstructorUsedError;
  int get startTimeSeconds => throw _privateConstructorUsedError;

  /// Serializes this StreamSegment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StreamSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreamSegmentCopyWith<StreamSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamSegmentCopyWith<$Res> {
  factory $StreamSegmentCopyWith(
          StreamSegment value, $Res Function(StreamSegment) then) =
      _$StreamSegmentCopyWithImpl<$Res, StreamSegment>;
  @useResult
  $Res call(
      {String? url, String? title, String? previewUrl, int startTimeSeconds});
}

/// @nodoc
class _$StreamSegmentCopyWithImpl<$Res, $Val extends StreamSegment>
    implements $StreamSegmentCopyWith<$Res> {
  _$StreamSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreamSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? title = freezed,
    Object? previewUrl = freezed,
    Object? startTimeSeconds = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      startTimeSeconds: null == startTimeSeconds
          ? _value.startTimeSeconds
          : startTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreamSegmentImplCopyWith<$Res>
    implements $StreamSegmentCopyWith<$Res> {
  factory _$$StreamSegmentImplCopyWith(
          _$StreamSegmentImpl value, $Res Function(_$StreamSegmentImpl) then) =
      __$$StreamSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url, String? title, String? previewUrl, int startTimeSeconds});
}

/// @nodoc
class __$$StreamSegmentImplCopyWithImpl<$Res>
    extends _$StreamSegmentCopyWithImpl<$Res, _$StreamSegmentImpl>
    implements _$$StreamSegmentImplCopyWith<$Res> {
  __$$StreamSegmentImplCopyWithImpl(
      _$StreamSegmentImpl _value, $Res Function(_$StreamSegmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of StreamSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? title = freezed,
    Object? previewUrl = freezed,
    Object? startTimeSeconds = null,
  }) {
    return _then(_$StreamSegmentImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      startTimeSeconds: null == startTimeSeconds
          ? _value.startTimeSeconds
          : startTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreamSegmentImpl implements _StreamSegment {
  const _$StreamSegmentImpl(
      {this.url, this.title, this.previewUrl, this.startTimeSeconds = 0});

  factory _$StreamSegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreamSegmentImplFromJson(json);

  @override
  final String? url;
  @override
  final String? title;
  @override
  final String? previewUrl;
  @override
  @JsonKey()
  final int startTimeSeconds;

  @override
  String toString() {
    return 'StreamSegment(url: $url, title: $title, previewUrl: $previewUrl, startTimeSeconds: $startTimeSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamSegmentImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl) &&
            (identical(other.startTimeSeconds, startTimeSeconds) ||
                other.startTimeSeconds == startTimeSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, title, previewUrl, startTimeSeconds);

  /// Create a copy of StreamSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamSegmentImplCopyWith<_$StreamSegmentImpl> get copyWith =>
      __$$StreamSegmentImplCopyWithImpl<_$StreamSegmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreamSegmentImplToJson(
      this,
    );
  }
}

abstract class _StreamSegment implements StreamSegment {
  const factory _StreamSegment(
      {final String? url,
      final String? title,
      final String? previewUrl,
      final int startTimeSeconds}) = _$StreamSegmentImpl;

  factory _StreamSegment.fromJson(Map<String, dynamic> json) =
      _$StreamSegmentImpl.fromJson;

  @override
  String? get url;
  @override
  String? get title;
  @override
  String? get previewUrl;
  @override
  int get startTimeSeconds;

  /// Create a copy of StreamSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreamSegmentImplCopyWith<_$StreamSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
