// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'frameset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Frameset _$FramesetFromJson(Map<String, dynamic> json) {
  return _Frameset.fromJson(json);
}

/// @nodoc
mixin _$Frameset {
  List<String> get urls => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this Frameset to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Frameset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FramesetCopyWith<Frameset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FramesetCopyWith<$Res> {
  factory $FramesetCopyWith(Frameset value, $Res Function(Frameset) then) =
      _$FramesetCopyWithImpl<$Res, Frameset>;
  @useResult
  $Res call({List<String> urls, int width, int height, int totalCount});
}

/// @nodoc
class _$FramesetCopyWithImpl<$Res, $Val extends Frameset>
    implements $FramesetCopyWith<$Res> {
  _$FramesetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Frameset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? width = null,
    Object? height = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FramesetImplCopyWith<$Res>
    implements $FramesetCopyWith<$Res> {
  factory _$$FramesetImplCopyWith(
          _$FramesetImpl value, $Res Function(_$FramesetImpl) then) =
      __$$FramesetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> urls, int width, int height, int totalCount});
}

/// @nodoc
class __$$FramesetImplCopyWithImpl<$Res>
    extends _$FramesetCopyWithImpl<$Res, _$FramesetImpl>
    implements _$$FramesetImplCopyWith<$Res> {
  __$$FramesetImplCopyWithImpl(
      _$FramesetImpl _value, $Res Function(_$FramesetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Frameset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? width = null,
    Object? height = null,
    Object? totalCount = null,
  }) {
    return _then(_$FramesetImpl(
      urls: null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FramesetImpl implements _Frameset {
  const _$FramesetImpl(
      {final List<String> urls = const [],
      this.width = 0,
      this.height = 0,
      this.totalCount = 0})
      : _urls = urls;

  factory _$FramesetImpl.fromJson(Map<String, dynamic> json) =>
      _$$FramesetImplFromJson(json);

  final List<String> _urls;
  @override
  @JsonKey()
  List<String> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  @JsonKey()
  final int width;
  @override
  @JsonKey()
  final int height;
  @override
  @JsonKey()
  final int totalCount;

  @override
  String toString() {
    return 'Frameset(urls: $urls, width: $width, height: $height, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FramesetImpl &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_urls), width, height, totalCount);

  /// Create a copy of Frameset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FramesetImplCopyWith<_$FramesetImpl> get copyWith =>
      __$$FramesetImplCopyWithImpl<_$FramesetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FramesetImplToJson(
      this,
    );
  }
}

abstract class _Frameset implements Frameset {
  const factory _Frameset(
      {final List<String> urls,
      final int width,
      final int height,
      final int totalCount}) = _$FramesetImpl;

  factory _Frameset.fromJson(Map<String, dynamic> json) =
      _$FramesetImpl.fromJson;

  @override
  List<String> get urls;
  @override
  int get width;
  @override
  int get height;
  @override
  int get totalCount;

  /// Create a copy of Frameset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FramesetImplCopyWith<_$FramesetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
