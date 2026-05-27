// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_info_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaylistInfoItem _$PlaylistInfoItemFromJson(Map<String, dynamic> json) {
  return _PlaylistInfoItem.fromJson(json);
}

/// @nodoc
mixin _$PlaylistInfoItem {
  String? get url => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get uploaderName => throw _privateConstructorUsedError;
  List<String> get thumbnails => throw _privateConstructorUsedError;
  int get streamCount => throw _privateConstructorUsedError;

  /// Serializes this PlaylistInfoItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaylistInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaylistInfoItemCopyWith<PlaylistInfoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistInfoItemCopyWith<$Res> {
  factory $PlaylistInfoItemCopyWith(
          PlaylistInfoItem value, $Res Function(PlaylistInfoItem) then) =
      _$PlaylistInfoItemCopyWithImpl<$Res, PlaylistInfoItem>;
  @useResult
  $Res call(
      {String? url,
      String? name,
      String? uploaderName,
      List<String> thumbnails,
      int streamCount});
}

/// @nodoc
class _$PlaylistInfoItemCopyWithImpl<$Res, $Val extends PlaylistInfoItem>
    implements $PlaylistInfoItemCopyWith<$Res> {
  _$PlaylistInfoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaylistInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? name = freezed,
    Object? uploaderName = freezed,
    Object? thumbnails = null,
    Object? streamCount = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uploaderName: freezed == uploaderName
          ? _value.uploaderName
          : uploaderName // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnails: null == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      streamCount: null == streamCount
          ? _value.streamCount
          : streamCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistInfoItemImplCopyWith<$Res>
    implements $PlaylistInfoItemCopyWith<$Res> {
  factory _$$PlaylistInfoItemImplCopyWith(_$PlaylistInfoItemImpl value,
          $Res Function(_$PlaylistInfoItemImpl) then) =
      __$$PlaylistInfoItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      String? name,
      String? uploaderName,
      List<String> thumbnails,
      int streamCount});
}

/// @nodoc
class __$$PlaylistInfoItemImplCopyWithImpl<$Res>
    extends _$PlaylistInfoItemCopyWithImpl<$Res, _$PlaylistInfoItemImpl>
    implements _$$PlaylistInfoItemImplCopyWith<$Res> {
  __$$PlaylistInfoItemImplCopyWithImpl(_$PlaylistInfoItemImpl _value,
      $Res Function(_$PlaylistInfoItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? name = freezed,
    Object? uploaderName = freezed,
    Object? thumbnails = null,
    Object? streamCount = null,
  }) {
    return _then(_$PlaylistInfoItemImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uploaderName: freezed == uploaderName
          ? _value.uploaderName
          : uploaderName // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnails: null == thumbnails
          ? _value._thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      streamCount: null == streamCount
          ? _value.streamCount
          : streamCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaylistInfoItemImpl implements _PlaylistInfoItem {
  const _$PlaylistInfoItemImpl(
      {this.url,
      this.name,
      this.uploaderName,
      final List<String> thumbnails = const [],
      this.streamCount = 0})
      : _thumbnails = thumbnails;

  factory _$PlaylistInfoItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistInfoItemImplFromJson(json);

  @override
  final String? url;
  @override
  final String? name;
  @override
  final String? uploaderName;
  final List<String> _thumbnails;
  @override
  @JsonKey()
  List<String> get thumbnails {
    if (_thumbnails is EqualUnmodifiableListView) return _thumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnails);
  }

  @override
  @JsonKey()
  final int streamCount;

  @override
  String toString() {
    return 'PlaylistInfoItem(url: $url, name: $name, uploaderName: $uploaderName, thumbnails: $thumbnails, streamCount: $streamCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistInfoItemImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uploaderName, uploaderName) ||
                other.uploaderName == uploaderName) &&
            const DeepCollectionEquality()
                .equals(other._thumbnails, _thumbnails) &&
            (identical(other.streamCount, streamCount) ||
                other.streamCount == streamCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, name, uploaderName,
      const DeepCollectionEquality().hash(_thumbnails), streamCount);

  /// Create a copy of PlaylistInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistInfoItemImplCopyWith<_$PlaylistInfoItemImpl> get copyWith =>
      __$$PlaylistInfoItemImplCopyWithImpl<_$PlaylistInfoItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistInfoItemImplToJson(
      this,
    );
  }
}

abstract class _PlaylistInfoItem implements PlaylistInfoItem {
  const factory _PlaylistInfoItem(
      {final String? url,
      final String? name,
      final String? uploaderName,
      final List<String> thumbnails,
      final int streamCount}) = _$PlaylistInfoItemImpl;

  factory _PlaylistInfoItem.fromJson(Map<String, dynamic> json) =
      _$PlaylistInfoItemImpl.fromJson;

  @override
  String? get url;
  @override
  String? get name;
  @override
  String? get uploaderName;
  @override
  List<String> get thumbnails;
  @override
  int get streamCount;

  /// Create a copy of PlaylistInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaylistInfoItemImplCopyWith<_$PlaylistInfoItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
