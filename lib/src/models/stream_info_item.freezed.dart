// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_info_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StreamInfoItem _$StreamInfoItemFromJson(Map<String, dynamic> json) {
  return _StreamInfoItem.fromJson(json);
}

/// @nodoc
mixin _$StreamInfoItem {
  String? get url => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get uploaderName => throw _privateConstructorUsedError;
  String? get uploaderUrl => throw _privateConstructorUsedError;
  List<String> get uploaderAvatars => throw _privateConstructorUsedError;
  String? get uploadDate => throw _privateConstructorUsedError;

  /// ISO 8601 date string. Null on older Android versions.
  String? get date => throw _privateConstructorUsedError;

  /// Duration in seconds.
  int? get duration => throw _privateConstructorUsedError;
  int? get viewCount => throw _privateConstructorUsedError;
  bool get isShort => throw _privateConstructorUsedError;
  List<String> get thumbnails => throw _privateConstructorUsedError;

  /// Serializes this StreamInfoItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StreamInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreamInfoItemCopyWith<StreamInfoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamInfoItemCopyWith<$Res> {
  factory $StreamInfoItemCopyWith(
          StreamInfoItem value, $Res Function(StreamInfoItem) then) =
      _$StreamInfoItemCopyWithImpl<$Res, StreamInfoItem>;
  @useResult
  $Res call(
      {String? url,
      String? id,
      String? name,
      String? uploaderName,
      String? uploaderUrl,
      List<String> uploaderAvatars,
      String? uploadDate,
      String? date,
      int? duration,
      int? viewCount,
      bool isShort,
      List<String> thumbnails});
}

/// @nodoc
class _$StreamInfoItemCopyWithImpl<$Res, $Val extends StreamInfoItem>
    implements $StreamInfoItemCopyWith<$Res> {
  _$StreamInfoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreamInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? uploaderName = freezed,
    Object? uploaderUrl = freezed,
    Object? uploaderAvatars = null,
    Object? uploadDate = freezed,
    Object? date = freezed,
    Object? duration = freezed,
    Object? viewCount = freezed,
    Object? isShort = null,
    Object? thumbnails = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uploaderName: freezed == uploaderName
          ? _value.uploaderName
          : uploaderName // ignore: cast_nullable_to_non_nullable
              as String?,
      uploaderUrl: freezed == uploaderUrl
          ? _value.uploaderUrl
          : uploaderUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      uploaderAvatars: null == uploaderAvatars
          ? _value.uploaderAvatars
          : uploaderAvatars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uploadDate: freezed == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isShort: null == isShort
          ? _value.isShort
          : isShort // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnails: null == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreamInfoItemImplCopyWith<$Res>
    implements $StreamInfoItemCopyWith<$Res> {
  factory _$$StreamInfoItemImplCopyWith(_$StreamInfoItemImpl value,
          $Res Function(_$StreamInfoItemImpl) then) =
      __$$StreamInfoItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      String? id,
      String? name,
      String? uploaderName,
      String? uploaderUrl,
      List<String> uploaderAvatars,
      String? uploadDate,
      String? date,
      int? duration,
      int? viewCount,
      bool isShort,
      List<String> thumbnails});
}

/// @nodoc
class __$$StreamInfoItemImplCopyWithImpl<$Res>
    extends _$StreamInfoItemCopyWithImpl<$Res, _$StreamInfoItemImpl>
    implements _$$StreamInfoItemImplCopyWith<$Res> {
  __$$StreamInfoItemImplCopyWithImpl(
      _$StreamInfoItemImpl _value, $Res Function(_$StreamInfoItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of StreamInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? uploaderName = freezed,
    Object? uploaderUrl = freezed,
    Object? uploaderAvatars = null,
    Object? uploadDate = freezed,
    Object? date = freezed,
    Object? duration = freezed,
    Object? viewCount = freezed,
    Object? isShort = null,
    Object? thumbnails = null,
  }) {
    return _then(_$StreamInfoItemImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uploaderName: freezed == uploaderName
          ? _value.uploaderName
          : uploaderName // ignore: cast_nullable_to_non_nullable
              as String?,
      uploaderUrl: freezed == uploaderUrl
          ? _value.uploaderUrl
          : uploaderUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      uploaderAvatars: null == uploaderAvatars
          ? _value._uploaderAvatars
          : uploaderAvatars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uploadDate: freezed == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isShort: null == isShort
          ? _value.isShort
          : isShort // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnails: null == thumbnails
          ? _value._thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreamInfoItemImpl implements _StreamInfoItem {
  const _$StreamInfoItemImpl(
      {this.url,
      this.id,
      this.name,
      this.uploaderName,
      this.uploaderUrl,
      final List<String> uploaderAvatars = const [],
      this.uploadDate,
      this.date,
      this.duration,
      this.viewCount,
      this.isShort = false,
      final List<String> thumbnails = const []})
      : _uploaderAvatars = uploaderAvatars,
        _thumbnails = thumbnails;

  factory _$StreamInfoItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreamInfoItemImplFromJson(json);

  @override
  final String? url;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? uploaderName;
  @override
  final String? uploaderUrl;
  final List<String> _uploaderAvatars;
  @override
  @JsonKey()
  List<String> get uploaderAvatars {
    if (_uploaderAvatars is EqualUnmodifiableListView) return _uploaderAvatars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uploaderAvatars);
  }

  @override
  final String? uploadDate;

  /// ISO 8601 date string. Null on older Android versions.
  @override
  final String? date;

  /// Duration in seconds.
  @override
  final int? duration;
  @override
  final int? viewCount;
  @override
  @JsonKey()
  final bool isShort;
  final List<String> _thumbnails;
  @override
  @JsonKey()
  List<String> get thumbnails {
    if (_thumbnails is EqualUnmodifiableListView) return _thumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnails);
  }

  @override
  String toString() {
    return 'StreamInfoItem(url: $url, id: $id, name: $name, uploaderName: $uploaderName, uploaderUrl: $uploaderUrl, uploaderAvatars: $uploaderAvatars, uploadDate: $uploadDate, date: $date, duration: $duration, viewCount: $viewCount, isShort: $isShort, thumbnails: $thumbnails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamInfoItemImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uploaderName, uploaderName) ||
                other.uploaderName == uploaderName) &&
            (identical(other.uploaderUrl, uploaderUrl) ||
                other.uploaderUrl == uploaderUrl) &&
            const DeepCollectionEquality()
                .equals(other._uploaderAvatars, _uploaderAvatars) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.isShort, isShort) || other.isShort == isShort) &&
            const DeepCollectionEquality()
                .equals(other._thumbnails, _thumbnails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      id,
      name,
      uploaderName,
      uploaderUrl,
      const DeepCollectionEquality().hash(_uploaderAvatars),
      uploadDate,
      date,
      duration,
      viewCount,
      isShort,
      const DeepCollectionEquality().hash(_thumbnails));

  /// Create a copy of StreamInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamInfoItemImplCopyWith<_$StreamInfoItemImpl> get copyWith =>
      __$$StreamInfoItemImplCopyWithImpl<_$StreamInfoItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreamInfoItemImplToJson(
      this,
    );
  }
}

abstract class _StreamInfoItem implements StreamInfoItem {
  const factory _StreamInfoItem(
      {final String? url,
      final String? id,
      final String? name,
      final String? uploaderName,
      final String? uploaderUrl,
      final List<String> uploaderAvatars,
      final String? uploadDate,
      final String? date,
      final int? duration,
      final int? viewCount,
      final bool isShort,
      final List<String> thumbnails}) = _$StreamInfoItemImpl;

  factory _StreamInfoItem.fromJson(Map<String, dynamic> json) =
      _$StreamInfoItemImpl.fromJson;

  @override
  String? get url;
  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get uploaderName;
  @override
  String? get uploaderUrl;
  @override
  List<String> get uploaderAvatars;
  @override
  String? get uploadDate;

  /// ISO 8601 date string. Null on older Android versions.
  @override
  String? get date;

  /// Duration in seconds.
  @override
  int? get duration;
  @override
  int? get viewCount;
  @override
  bool get isShort;
  @override
  List<String> get thumbnails;

  /// Create a copy of StreamInfoItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreamInfoItemImplCopyWith<_$StreamInfoItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
