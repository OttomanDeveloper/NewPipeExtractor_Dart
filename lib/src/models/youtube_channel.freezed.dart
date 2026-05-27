// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YoutubeChannel _$YoutubeChannelFromJson(Map<String, dynamic> json) {
  return _YoutubeChannel.fromJson(json);
}

/// @nodoc
mixin _$YoutubeChannel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  List<String> get avatars => throw _privateConstructorUsedError;
  List<String> get banners => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get feedUrl => throw _privateConstructorUsedError;
  int? get subscriberCount => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  List<ChannelTab> get tabs => throw _privateConstructorUsedError;

  /// Serializes this YoutubeChannel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YoutubeChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YoutubeChannelCopyWith<YoutubeChannel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeChannelCopyWith<$Res> {
  factory $YoutubeChannelCopyWith(
          YoutubeChannel value, $Res Function(YoutubeChannel) then) =
      _$YoutubeChannelCopyWithImpl<$Res, YoutubeChannel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? url,
      List<String> avatars,
      List<String> banners,
      String? description,
      String? feedUrl,
      int? subscriberCount,
      bool isVerified,
      List<ChannelTab> tabs});
}

/// @nodoc
class _$YoutubeChannelCopyWithImpl<$Res, $Val extends YoutubeChannel>
    implements $YoutubeChannelCopyWith<$Res> {
  _$YoutubeChannelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubeChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? avatars = null,
    Object? banners = null,
    Object? description = freezed,
    Object? feedUrl = freezed,
    Object? subscriberCount = freezed,
    Object? isVerified = null,
    Object? tabs = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      avatars: null == avatars
          ? _value.avatars
          : avatars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      feedUrl: freezed == feedUrl
          ? _value.feedUrl
          : feedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriberCount: freezed == subscriberCount
          ? _value.subscriberCount
          : subscriberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      tabs: null == tabs
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<ChannelTab>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YoutubeChannelImplCopyWith<$Res>
    implements $YoutubeChannelCopyWith<$Res> {
  factory _$$YoutubeChannelImplCopyWith(_$YoutubeChannelImpl value,
          $Res Function(_$YoutubeChannelImpl) then) =
      __$$YoutubeChannelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? url,
      List<String> avatars,
      List<String> banners,
      String? description,
      String? feedUrl,
      int? subscriberCount,
      bool isVerified,
      List<ChannelTab> tabs});
}

/// @nodoc
class __$$YoutubeChannelImplCopyWithImpl<$Res>
    extends _$YoutubeChannelCopyWithImpl<$Res, _$YoutubeChannelImpl>
    implements _$$YoutubeChannelImplCopyWith<$Res> {
  __$$YoutubeChannelImplCopyWithImpl(
      _$YoutubeChannelImpl _value, $Res Function(_$YoutubeChannelImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubeChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? avatars = null,
    Object? banners = null,
    Object? description = freezed,
    Object? feedUrl = freezed,
    Object? subscriberCount = freezed,
    Object? isVerified = null,
    Object? tabs = null,
  }) {
    return _then(_$YoutubeChannelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      avatars: null == avatars
          ? _value._avatars
          : avatars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      banners: null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      feedUrl: freezed == feedUrl
          ? _value.feedUrl
          : feedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriberCount: freezed == subscriberCount
          ? _value.subscriberCount
          : subscriberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      tabs: null == tabs
          ? _value._tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<ChannelTab>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YoutubeChannelImpl implements _YoutubeChannel {
  const _$YoutubeChannelImpl(
      {this.id,
      this.name,
      this.url,
      final List<String> avatars = const [],
      final List<String> banners = const [],
      this.description,
      this.feedUrl,
      this.subscriberCount,
      this.isVerified = false,
      final List<ChannelTab> tabs = const []})
      : _avatars = avatars,
        _banners = banners,
        _tabs = tabs;

  factory _$YoutubeChannelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YoutubeChannelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? url;
  final List<String> _avatars;
  @override
  @JsonKey()
  List<String> get avatars {
    if (_avatars is EqualUnmodifiableListView) return _avatars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_avatars);
  }

  final List<String> _banners;
  @override
  @JsonKey()
  List<String> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  @override
  final String? description;
  @override
  final String? feedUrl;
  @override
  final int? subscriberCount;
  @override
  @JsonKey()
  final bool isVerified;
  final List<ChannelTab> _tabs;
  @override
  @JsonKey()
  List<ChannelTab> get tabs {
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabs);
  }

  @override
  String toString() {
    return 'YoutubeChannel(id: $id, name: $name, url: $url, avatars: $avatars, banners: $banners, description: $description, feedUrl: $feedUrl, subscriberCount: $subscriberCount, isVerified: $isVerified, tabs: $tabs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoutubeChannelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._avatars, _avatars) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.feedUrl, feedUrl) || other.feedUrl == feedUrl) &&
            (identical(other.subscriberCount, subscriberCount) ||
                other.subscriberCount == subscriberCount) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            const DeepCollectionEquality().equals(other._tabs, _tabs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      url,
      const DeepCollectionEquality().hash(_avatars),
      const DeepCollectionEquality().hash(_banners),
      description,
      feedUrl,
      subscriberCount,
      isVerified,
      const DeepCollectionEquality().hash(_tabs));

  /// Create a copy of YoutubeChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YoutubeChannelImplCopyWith<_$YoutubeChannelImpl> get copyWith =>
      __$$YoutubeChannelImplCopyWithImpl<_$YoutubeChannelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YoutubeChannelImplToJson(
      this,
    );
  }
}

abstract class _YoutubeChannel implements YoutubeChannel {
  const factory _YoutubeChannel(
      {final String? id,
      final String? name,
      final String? url,
      final List<String> avatars,
      final List<String> banners,
      final String? description,
      final String? feedUrl,
      final int? subscriberCount,
      final bool isVerified,
      final List<ChannelTab> tabs}) = _$YoutubeChannelImpl;

  factory _YoutubeChannel.fromJson(Map<String, dynamic> json) =
      _$YoutubeChannelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get url;
  @override
  List<String> get avatars;
  @override
  List<String> get banners;
  @override
  String? get description;
  @override
  String? get feedUrl;
  @override
  int? get subscriberCount;
  @override
  bool get isVerified;
  @override
  List<ChannelTab> get tabs;

  /// Create a copy of YoutubeChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YoutubeChannelImplCopyWith<_$YoutubeChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
