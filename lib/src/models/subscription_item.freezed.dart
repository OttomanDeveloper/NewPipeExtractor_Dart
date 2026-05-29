// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubscriptionItem _$SubscriptionItemFromJson(Map<String, dynamic> json) {
  return _SubscriptionItem.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionItem {
  int get serviceId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionItemCopyWith<SubscriptionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionItemCopyWith<$Res> {
  factory $SubscriptionItemCopyWith(
          SubscriptionItem value, $Res Function(SubscriptionItem) then) =
      _$SubscriptionItemCopyWithImpl<$Res, SubscriptionItem>;
  @useResult
  $Res call({int serviceId, String? url, String? name});
}

/// @nodoc
class _$SubscriptionItemCopyWithImpl<$Res, $Val extends SubscriptionItem>
    implements $SubscriptionItemCopyWith<$Res> {
  _$SubscriptionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? url = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionItemImplCopyWith<$Res>
    implements $SubscriptionItemCopyWith<$Res> {
  factory _$$SubscriptionItemImplCopyWith(_$SubscriptionItemImpl value,
          $Res Function(_$SubscriptionItemImpl) then) =
      __$$SubscriptionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int serviceId, String? url, String? name});
}

/// @nodoc
class __$$SubscriptionItemImplCopyWithImpl<$Res>
    extends _$SubscriptionItemCopyWithImpl<$Res, _$SubscriptionItemImpl>
    implements _$$SubscriptionItemImplCopyWith<$Res> {
  __$$SubscriptionItemImplCopyWithImpl(_$SubscriptionItemImpl _value,
      $Res Function(_$SubscriptionItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? url = freezed,
    Object? name = freezed,
  }) {
    return _then(_$SubscriptionItemImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionItemImpl implements _SubscriptionItem {
  const _$SubscriptionItemImpl({required this.serviceId, this.url, this.name});

  factory _$SubscriptionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionItemImplFromJson(json);

  @override
  final int serviceId;
  @override
  final String? url;
  @override
  final String? name;

  @override
  String toString() {
    return 'SubscriptionItem(serviceId: $serviceId, url: $url, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionItemImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceId, url, name);

  /// Create a copy of SubscriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionItemImplCopyWith<_$SubscriptionItemImpl> get copyWith =>
      __$$SubscriptionItemImplCopyWithImpl<_$SubscriptionItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionItemImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionItem implements SubscriptionItem {
  const factory _SubscriptionItem(
      {required final int serviceId,
      final String? url,
      final String? name}) = _$SubscriptionItemImpl;

  factory _SubscriptionItem.fromJson(Map<String, dynamic> json) =
      _$SubscriptionItemImpl.fromJson;

  @override
  int get serviceId;
  @override
  String? get url;
  @override
  String? get name;

  /// Create a copy of SubscriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionItemImplCopyWith<_$SubscriptionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
