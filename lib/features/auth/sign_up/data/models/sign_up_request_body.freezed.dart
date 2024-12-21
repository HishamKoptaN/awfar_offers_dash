// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpRequestBody _$SignUpRequestBodyFromJson(Map<String, dynamic> json) {
  return _SignUpRequestBody.fromJson(json);
}

/// @nodoc
mixin _$SignUpRequestBody {
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: "password_confirmation")
  String get passwordConfirmation => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this SignUpRequestBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpRequestBodyCopyWith<SignUpRequestBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpRequestBodyCopyWith<$Res> {
  factory $SignUpRequestBodyCopyWith(
          SignUpRequestBody value, $Res Function(SignUpRequestBody) then) =
      _$SignUpRequestBodyCopyWithImpl<$Res, SignUpRequestBody>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String name,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "password") String password,
      @JsonKey(name: "password_confirmation") String passwordConfirmation,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "phone") String phone});
}

/// @nodoc
class _$SignUpRequestBodyCopyWithImpl<$Res, $Val extends SignUpRequestBody>
    implements $SignUpRequestBodyCopyWith<$Res> {
  _$SignUpRequestBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? address = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpRequestBodyImplCopyWith<$Res>
    implements $SignUpRequestBodyCopyWith<$Res> {
  factory _$$SignUpRequestBodyImplCopyWith(_$SignUpRequestBodyImpl value,
          $Res Function(_$SignUpRequestBodyImpl) then) =
      __$$SignUpRequestBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String name,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "password") String password,
      @JsonKey(name: "password_confirmation") String passwordConfirmation,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "phone") String phone});
}

/// @nodoc
class __$$SignUpRequestBodyImplCopyWithImpl<$Res>
    extends _$SignUpRequestBodyCopyWithImpl<$Res, _$SignUpRequestBodyImpl>
    implements _$$SignUpRequestBodyImplCopyWith<$Res> {
  __$$SignUpRequestBodyImplCopyWithImpl(_$SignUpRequestBodyImpl _value,
      $Res Function(_$SignUpRequestBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? address = null,
    Object? phone = null,
  }) {
    return _then(_$SignUpRequestBodyImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpRequestBodyImpl implements _SignUpRequestBody {
  const _$SignUpRequestBodyImpl(
      {@JsonKey(name: "name") required this.name,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "password") required this.password,
      @JsonKey(name: "password_confirmation")
      required this.passwordConfirmation,
      @JsonKey(name: "address") required this.address,
      @JsonKey(name: "phone") required this.phone});

  factory _$SignUpRequestBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpRequestBodyImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "password")
  final String password;
  @override
  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;
  @override
  @JsonKey(name: "address")
  final String address;
  @override
  @JsonKey(name: "phone")
  final String phone;

  @override
  String toString() {
    return 'SignUpRequestBody(name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, address: $address, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpRequestBodyImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, email, password, passwordConfirmation, address, phone);

  /// Create a copy of SignUpRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpRequestBodyImplCopyWith<_$SignUpRequestBodyImpl> get copyWith =>
      __$$SignUpRequestBodyImplCopyWithImpl<_$SignUpRequestBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpRequestBodyImplToJson(
      this,
    );
  }
}

abstract class _SignUpRequestBody implements SignUpRequestBody {
  const factory _SignUpRequestBody(
          {@JsonKey(name: "name") required final String name,
          @JsonKey(name: "email") required final String email,
          @JsonKey(name: "password") required final String password,
          @JsonKey(name: "password_confirmation")
          required final String passwordConfirmation,
          @JsonKey(name: "address") required final String address,
          @JsonKey(name: "phone") required final String phone}) =
      _$SignUpRequestBodyImpl;

  factory _SignUpRequestBody.fromJson(Map<String, dynamic> json) =
      _$SignUpRequestBodyImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "password")
  String get password;
  @override
  @JsonKey(name: "password_confirmation")
  String get passwordConfirmation;
  @override
  @JsonKey(name: "address")
  String get address;
  @override
  @JsonKey(name: "phone")
  String get phone;

  /// Create a copy of SignUpRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpRequestBodyImplCopyWith<_$SignUpRequestBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
