// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent<T> {
  LoginRequestBody get loginRequestBody => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginRequestBody loginRequestBody) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginRequestBody loginRequestBody)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginRequestBody loginRequestBody)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login<T> value) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login<T> value)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login<T> value)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginEventCopyWith<T, LoginEvent<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<T, $Res> {
  factory $LoginEventCopyWith(
          LoginEvent<T> value, $Res Function(LoginEvent<T>) then) =
      _$LoginEventCopyWithImpl<T, $Res, LoginEvent<T>>;
  @useResult
  $Res call({LoginRequestBody loginRequestBody});
}

/// @nodoc
class _$LoginEventCopyWithImpl<T, $Res, $Val extends LoginEvent<T>>
    implements $LoginEventCopyWith<T, $Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginRequestBody = null,
  }) {
    return _then(_value.copyWith(
      loginRequestBody: null == loginRequestBody
          ? _value.loginRequestBody
          : loginRequestBody // ignore: cast_nullable_to_non_nullable
              as LoginRequestBody,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginImplCopyWith<T, $Res>
    implements $LoginEventCopyWith<T, $Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl<T> value, $Res Function(_$LoginImpl<T>) then) =
      __$$LoginImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({LoginRequestBody loginRequestBody});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<T, $Res>
    extends _$LoginEventCopyWithImpl<T, $Res, _$LoginImpl<T>>
    implements _$$LoginImplCopyWith<T, $Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl<T> _value, $Res Function(_$LoginImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginRequestBody = null,
  }) {
    return _then(_$LoginImpl<T>(
      loginRequestBody: null == loginRequestBody
          ? _value.loginRequestBody
          : loginRequestBody // ignore: cast_nullable_to_non_nullable
              as LoginRequestBody,
    ));
  }
}

/// @nodoc

class _$LoginImpl<T> implements _Login<T> {
  const _$LoginImpl({required this.loginRequestBody});

  @override
  final LoginRequestBody loginRequestBody;

  @override
  String toString() {
    return 'LoginEvent<$T>.login(loginRequestBody: $loginRequestBody)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl<T> &&
            (identical(other.loginRequestBody, loginRequestBody) ||
                other.loginRequestBody == loginRequestBody));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginRequestBody);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<T, _$LoginImpl<T>> get copyWith =>
      __$$LoginImplCopyWithImpl<T, _$LoginImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginRequestBody loginRequestBody) login,
  }) {
    return login(loginRequestBody);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginRequestBody loginRequestBody)? login,
  }) {
    return login?.call(loginRequestBody);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginRequestBody loginRequestBody)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(loginRequestBody);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login<T> value) login,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login<T> value)? login,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login<T> value)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login<T> implements LoginEvent<T> {
  const factory _Login({required final LoginRequestBody loginRequestBody}) =
      _$LoginImpl<T>;

  @override
  LoginRequestBody get loginRequestBody;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginImplCopyWith<T, _$LoginImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
