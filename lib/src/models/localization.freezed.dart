// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Localization _$LocalizationFromJson(Map<String, dynamic> json) {
  return _Localization.fromJson(json);
}

/// @nodoc
mixin _$Localization {
  String get languageCode => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get localizationCode => throw _privateConstructorUsedError;

  /// Serializes this Localization to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Localization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalizationCopyWith<Localization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationCopyWith<$Res> {
  factory $LocalizationCopyWith(
          Localization value, $Res Function(Localization) then) =
      _$LocalizationCopyWithImpl<$Res, Localization>;
  @useResult
  $Res call({String languageCode, String countryCode, String localizationCode});
}

/// @nodoc
class _$LocalizationCopyWithImpl<$Res, $Val extends Localization>
    implements $LocalizationCopyWith<$Res> {
  _$LocalizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Localization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? countryCode = null,
    Object? localizationCode = null,
  }) {
    return _then(_value.copyWith(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      localizationCode: null == localizationCode
          ? _value.localizationCode
          : localizationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalizationImplCopyWith<$Res>
    implements $LocalizationCopyWith<$Res> {
  factory _$$LocalizationImplCopyWith(
          _$LocalizationImpl value, $Res Function(_$LocalizationImpl) then) =
      __$$LocalizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String languageCode, String countryCode, String localizationCode});
}

/// @nodoc
class __$$LocalizationImplCopyWithImpl<$Res>
    extends _$LocalizationCopyWithImpl<$Res, _$LocalizationImpl>
    implements _$$LocalizationImplCopyWith<$Res> {
  __$$LocalizationImplCopyWithImpl(
      _$LocalizationImpl _value, $Res Function(_$LocalizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Localization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? countryCode = null,
    Object? localizationCode = null,
  }) {
    return _then(_$LocalizationImpl(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      localizationCode: null == localizationCode
          ? _value.localizationCode
          : localizationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalizationImpl implements _Localization {
  const _$LocalizationImpl(
      {required this.languageCode,
      required this.countryCode,
      required this.localizationCode});

  factory _$LocalizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalizationImplFromJson(json);

  @override
  final String languageCode;
  @override
  final String countryCode;
  @override
  final String localizationCode;

  @override
  String toString() {
    return 'Localization(languageCode: $languageCode, countryCode: $countryCode, localizationCode: $localizationCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizationImpl &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.localizationCode, localizationCode) ||
                other.localizationCode == localizationCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, languageCode, countryCode, localizationCode);

  /// Create a copy of Localization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizationImplCopyWith<_$LocalizationImpl> get copyWith =>
      __$$LocalizationImplCopyWithImpl<_$LocalizationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalizationImplToJson(
      this,
    );
  }
}

abstract class _Localization implements Localization {
  const factory _Localization(
      {required final String languageCode,
      required final String countryCode,
      required final String localizationCode}) = _$LocalizationImpl;

  factory _Localization.fromJson(Map<String, dynamic> json) =
      _$LocalizationImpl.fromJson;

  @override
  String get languageCode;
  @override
  String get countryCode;
  @override
  String get localizationCode;

  /// Create a copy of Localization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalizationImplCopyWith<_$LocalizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentCountry _$ContentCountryFromJson(Map<String, dynamic> json) {
  return _ContentCountry.fromJson(json);
}

/// @nodoc
mixin _$ContentCountry {
  String get countryCode => throw _privateConstructorUsedError;

  /// Serializes this ContentCountry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentCountry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentCountryCopyWith<ContentCountry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCountryCopyWith<$Res> {
  factory $ContentCountryCopyWith(
          ContentCountry value, $Res Function(ContentCountry) then) =
      _$ContentCountryCopyWithImpl<$Res, ContentCountry>;
  @useResult
  $Res call({String countryCode});
}

/// @nodoc
class _$ContentCountryCopyWithImpl<$Res, $Val extends ContentCountry>
    implements $ContentCountryCopyWith<$Res> {
  _$ContentCountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentCountry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
  }) {
    return _then(_value.copyWith(
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentCountryImplCopyWith<$Res>
    implements $ContentCountryCopyWith<$Res> {
  factory _$$ContentCountryImplCopyWith(_$ContentCountryImpl value,
          $Res Function(_$ContentCountryImpl) then) =
      __$$ContentCountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String countryCode});
}

/// @nodoc
class __$$ContentCountryImplCopyWithImpl<$Res>
    extends _$ContentCountryCopyWithImpl<$Res, _$ContentCountryImpl>
    implements _$$ContentCountryImplCopyWith<$Res> {
  __$$ContentCountryImplCopyWithImpl(
      _$ContentCountryImpl _value, $Res Function(_$ContentCountryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentCountry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
  }) {
    return _then(_$ContentCountryImpl(
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentCountryImpl implements _ContentCountry {
  const _$ContentCountryImpl({required this.countryCode});

  factory _$ContentCountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentCountryImplFromJson(json);

  @override
  final String countryCode;

  @override
  String toString() {
    return 'ContentCountry(countryCode: $countryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentCountryImpl &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, countryCode);

  /// Create a copy of ContentCountry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentCountryImplCopyWith<_$ContentCountryImpl> get copyWith =>
      __$$ContentCountryImplCopyWithImpl<_$ContentCountryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentCountryImplToJson(
      this,
    );
  }
}

abstract class _ContentCountry implements ContentCountry {
  const factory _ContentCountry({required final String countryCode}) =
      _$ContentCountryImpl;

  factory _ContentCountry.fromJson(Map<String, dynamic> json) =
      _$ContentCountryImpl.fromJson;

  @override
  String get countryCode;

  /// Create a copy of ContentCountry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentCountryImplCopyWith<_$ContentCountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
