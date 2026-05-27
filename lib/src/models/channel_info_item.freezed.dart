// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_info_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChannelInfoItem _$ChannelInfoItemFromJson(Map<String, dynamic> json) {
  return _ChannelInfoItem.fromJson(json);
}

/// @nodoc
mixin _$ChannelInfoItem {
  String? get url => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get thumbnails => throw _privateConstructorUsedError;
  int? get subscriberCount => throw _privateConstructorUsedError;
  int get streamCount => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  /// Serializes this ChannelInfoItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChannelInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelInfoItemCopyWith<ChannelInfoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelInfoItemCopyWith<$Res> {
  factory $ChannelInfoItemCopyWith(
          ChannelInfoItem value, $Res Function(ChannelInfoItem) then) =
      _$ChannelInfoItemCopyWithImpl<$Res, ChannelInfoItem>;
  @useResult
  $Res call(
      {String? url,
      String? name,
      String? description,
      List<String> thumbnails,
      int? subscriberCount,
      int streamCount,
      bool isVerified});
}

/// @nodoc
class _$ChannelInfoItemCopyWithImpl<$Res, $Val extends ChannelInfoItem>
    implements $ChannelInfoItemCopyWith<$Res> {
  _$ChannelInfoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? thumbnails = null,
    Object? subscriberCount = freezed,
    Object? streamCount = null,
    Object? isVerified = null,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnails: null == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subscriberCount: freezed == subscriberCount
          ? _value.subscriberCount
          : subscriberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      streamCount: null == streamCount
          ? _value.streamCount
          : streamCount // ignore: cast_nullable_to_non_nullable
              as int,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelInfoItemImplCopyWith<$Res>
    implements $ChannelInfoItemCopyWith<$Res> {
  factory _$$ChannelInfoItemImplCopyWith(_$ChannelInfoItemImpl value,
          $Res Function(_$ChannelInfoItemImpl) then) =
      __$$ChannelInfoItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      String? name,
      String? description,
      List<String> thumbnails,
      int? subscriberCount,
      int streamCount,
      bool isVerified});
}

/// @nodoc
class __$$ChannelInfoItemImplCopyWithImpl<$Res>
    extends _$ChannelInfoItemCopyWithImpl<$Res, _$ChannelInfoItemImpl>
    implements _$$ChannelInfoItemImplCopyWith<$Res> {
  __$$ChannelInfoItemImplCopyWithImpl(
      _$ChannelInfoItemImpl _value, $Res Function(_$ChannelInfoItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? thumbnails = null,
    Object? subscriberCount = freezed,
    Object? streamCount = null,
    Object? isVerified = null,
  }) {
    return _then(_$ChannelInfoItemImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnails: null == thumbnails
          ? _value._thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subscriberCount: freezed == subscriberCount
          ? _value.subscriberCount
          : subscriberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      streamCount: null == streamCount
          ? _value.streamCount
          : streamCount // ignore: cast_nullable_to_non_nullable
              as int,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelInfoItemImpl implements _ChannelInfoItem {
  const _$ChannelInfoItemImpl(
      {this.url,
      this.name,
      this.description,
      final List<String> thumbnails = const [],
      this.subscriberCount,
      this.streamCount = 0,
      this.isVerified = false})
      : _thumbnails = thumbnails;

  factory _$ChannelInfoItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelInfoItemImplFromJson(json);

  @override
  final String? url;
  @override
  final String? name;
  @override
  final String? description;
  final List<String> _thumbnails;
  @override
  @JsonKey()
  List<String> get thumbnails {
    if (_thumbnails is EqualUnmodifiableListView) return _thumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnails);
  }

  @override
  final int? subscriberCount;
  @override
  @JsonKey()
  final int streamCount;
  @override
  @JsonKey()
  final bool isVerified;

  @override
  String toString() {
    return 'ChannelInfoItem(url: $url, name: $name, description: $description, thumbnails: $thumbnails, subscriberCount: $subscriberCount, streamCount: $streamCount, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelInfoItemImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._thumbnails, _thumbnails) &&
            (identical(other.subscriberCount, subscriberCount) ||
                other.subscriberCount == subscriberCount) &&
            (identical(other.streamCount, streamCount) ||
                other.streamCount == streamCount) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      name,
      description,
      const DeepCollectionEquality().hash(_thumbnails),
      subscriberCount,
      streamCount,
      isVerified);

  /// Create a copy of ChannelInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelInfoItemImplCopyWith<_$ChannelInfoItemImpl> get copyWith =>
      __$$ChannelInfoItemImplCopyWithImpl<_$ChannelInfoItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelInfoItemImplToJson(
      this,
    );
  }
}

abstract class _ChannelInfoItem implements ChannelInfoItem {
  const factory _ChannelInfoItem(
      {final String? url,
      final String? name,
      final String? description,
      final List<String> thumbnails,
      final int? subscriberCount,
      final int streamCount,
      final bool isVerified}) = _$ChannelInfoItemImpl;

  factory _ChannelInfoItem.fromJson(Map<String, dynamic> json) =
      _$ChannelInfoItemImpl.fromJson;

  @override
  String? get url;
  @override
  String? get name;
  @override
  String? get description;
  @override
  List<String> get thumbnails;
  @override
  int? get subscriberCount;
  @override
  int get streamCount;
  @override
  bool get isVerified;

  /// Create a copy of ChannelInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelInfoItemImplCopyWith<_$ChannelInfoItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
