// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_country_request_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddCountryRequestModel _$AddCountryRequestModelFromJson(
    Map<String, dynamic> json) {
  return _AddCountryRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AddCountryRequestModel {
  @JsonKey(name: "code")
  String get code => throw _privateConstructorUsedError;

  /// Serializes this AddCountryRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddCountryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddCountryRequestModelCopyWith<AddCountryRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCountryRequestModelCopyWith<$Res> {
  factory $AddCountryRequestModelCopyWith(AddCountryRequestModel value,
          $Res Function(AddCountryRequestModel) then) =
      _$AddCountryRequestModelCopyWithImpl<$Res, AddCountryRequestModel>;
  @useResult
  $Res call({@JsonKey(name: "code") String code});
}

/// @nodoc
class _$AddCountryRequestModelCopyWithImpl<$Res,
        $Val extends AddCountryRequestModel>
    implements $AddCountryRequestModelCopyWith<$Res> {
  _$AddCountryRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddCountryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCountryRequestModelImplCopyWith<$Res>
    implements $AddCountryRequestModelCopyWith<$Res> {
  factory _$$AddCountryRequestModelImplCopyWith(
          _$AddCountryRequestModelImpl value,
          $Res Function(_$AddCountryRequestModelImpl) then) =
      __$$AddCountryRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "code") String code});
}

/// @nodoc
class __$$AddCountryRequestModelImplCopyWithImpl<$Res>
    extends _$AddCountryRequestModelCopyWithImpl<$Res,
        _$AddCountryRequestModelImpl>
    implements _$$AddCountryRequestModelImplCopyWith<$Res> {
  __$$AddCountryRequestModelImplCopyWithImpl(
      _$AddCountryRequestModelImpl _value,
      $Res Function(_$AddCountryRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddCountryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$AddCountryRequestModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddCountryRequestModelImpl implements _AddCountryRequestModel {
  const _$AddCountryRequestModelImpl(
      {@JsonKey(name: "code") required this.code});

  factory _$AddCountryRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddCountryRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "code")
  final String code;

  @override
  String toString() {
    return 'AddCountryRequestModel(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCountryRequestModelImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code);

  /// Create a copy of AddCountryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCountryRequestModelImplCopyWith<_$AddCountryRequestModelImpl>
      get copyWith => __$$AddCountryRequestModelImplCopyWithImpl<
          _$AddCountryRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddCountryRequestModelImplToJson(
      this,
    );
  }
}

abstract class _AddCountryRequestModel implements AddCountryRequestModel {
  const factory _AddCountryRequestModel(
          {@JsonKey(name: "code") required final String code}) =
      _$AddCountryRequestModelImpl;

  factory _AddCountryRequestModel.fromJson(Map<String, dynamic> json) =
      _$AddCountryRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "code")
  String get code;

  /// Create a copy of AddCountryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCountryRequestModelImplCopyWith<_$AddCountryRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
