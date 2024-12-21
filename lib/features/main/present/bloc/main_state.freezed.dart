// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() logedOut,
    required TResult Function() notVerify,
    required TResult Function() verified,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? logedOut,
    TResult? Function()? notVerify,
    TResult? Function()? verified,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? logedOut,
    TResult Function()? notVerify,
    TResult Function()? verified,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_NotVerify value) notVerify,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_NotVerify value)? notVerify,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_NotVerify value)? notVerify,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MainState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() logedOut,
    required TResult Function() notVerify,
    required TResult Function() verified,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? logedOut,
    TResult? Function()? notVerify,
    TResult? Function()? verified,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? logedOut,
    TResult Function()? notVerify,
    TResult Function()? verified,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_NotVerify value) notVerify,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_NotVerify value)? notVerify,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_NotVerify value)? notVerify,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MainState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadInProgressImpl implements _LoadInProgress {
  const _$LoadInProgressImpl();

  @override
  String toString() {
    return 'MainState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() logedOut,
    required TResult Function() notVerify,
    required TResult Function() verified,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? logedOut,
    TResult? Function()? notVerify,
    TResult? Function()? verified,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? logedOut,
    TResult Function()? notVerify,
    TResult Function()? verified,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_NotVerify value) notVerify,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_NotVerify value)? notVerify,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_NotVerify value)? notVerify,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements MainState {
  const factory _LoadInProgress() = _$LoadInProgressImpl;
}

/// @nodoc
abstract class _$$LogedInImplCopyWith<$Res> {
  factory _$$LogedInImplCopyWith(
          _$LogedInImpl value, $Res Function(_$LogedInImpl) then) =
      __$$LogedInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogedInImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$LogedInImpl>
    implements _$$LogedInImplCopyWith<$Res> {
  __$$LogedInImplCopyWithImpl(
      _$LogedInImpl _value, $Res Function(_$LogedInImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogedInImpl implements _LogedIn {
  const _$LogedInImpl();

  @override
  String toString() {
    return 'MainState.logedIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogedInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() logedOut,
    required TResult Function() notVerify,
    required TResult Function() verified,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    return logedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? logedOut,
    TResult? Function()? notVerify,
    TResult? Function()? verified,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    return logedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? logedOut,
    TResult Function()? notVerify,
    TResult Function()? verified,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    if (logedIn != null) {
      return logedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_NotVerify value) notVerify,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return logedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_NotVerify value)? notVerify,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return logedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_NotVerify value)? notVerify,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (logedIn != null) {
      return logedIn(this);
    }
    return orElse();
  }
}

abstract class _LogedIn implements MainState {
  const factory _LogedIn() = _$LogedInImpl;
}

/// @nodoc
abstract class _$$LogedOutImplCopyWith<$Res> {
  factory _$$LogedOutImplCopyWith(
          _$LogedOutImpl value, $Res Function(_$LogedOutImpl) then) =
      __$$LogedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogedOutImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$LogedOutImpl>
    implements _$$LogedOutImplCopyWith<$Res> {
  __$$LogedOutImplCopyWithImpl(
      _$LogedOutImpl _value, $Res Function(_$LogedOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogedOutImpl implements _LogedOut {
  const _$LogedOutImpl();

  @override
  String toString() {
    return 'MainState.logedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() logedOut,
    required TResult Function() notVerify,
    required TResult Function() verified,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    return logedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? logedOut,
    TResult? Function()? notVerify,
    TResult? Function()? verified,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    return logedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? logedOut,
    TResult Function()? notVerify,
    TResult Function()? verified,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    if (logedOut != null) {
      return logedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_NotVerify value) notVerify,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return logedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_NotVerify value)? notVerify,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return logedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_NotVerify value)? notVerify,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (logedOut != null) {
      return logedOut(this);
    }
    return orElse();
  }
}

abstract class _LogedOut implements MainState {
  const factory _LogedOut() = _$LogedOutImpl;
}

/// @nodoc
abstract class _$$NotVerifyImplCopyWith<$Res> {
  factory _$$NotVerifyImplCopyWith(
          _$NotVerifyImpl value, $Res Function(_$NotVerifyImpl) then) =
      __$$NotVerifyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotVerifyImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$NotVerifyImpl>
    implements _$$NotVerifyImplCopyWith<$Res> {
  __$$NotVerifyImplCopyWithImpl(
      _$NotVerifyImpl _value, $Res Function(_$NotVerifyImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotVerifyImpl implements _NotVerify {
  const _$NotVerifyImpl();

  @override
  String toString() {
    return 'MainState.notVerify()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotVerifyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() logedOut,
    required TResult Function() notVerify,
    required TResult Function() verified,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    return notVerify();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? logedOut,
    TResult? Function()? notVerify,
    TResult? Function()? verified,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    return notVerify?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? logedOut,
    TResult Function()? notVerify,
    TResult Function()? verified,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    if (notVerify != null) {
      return notVerify();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_NotVerify value) notVerify,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return notVerify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_NotVerify value)? notVerify,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return notVerify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_NotVerify value)? notVerify,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (notVerify != null) {
      return notVerify(this);
    }
    return orElse();
  }
}

abstract class _NotVerify implements MainState {
  const factory _NotVerify() = _$NotVerifyImpl;
}

/// @nodoc
abstract class _$$VerifiedImplCopyWith<$Res> {
  factory _$$VerifiedImplCopyWith(
          _$VerifiedImpl value, $Res Function(_$VerifiedImpl) then) =
      __$$VerifiedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifiedImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$VerifiedImpl>
    implements _$$VerifiedImplCopyWith<$Res> {
  __$$VerifiedImplCopyWithImpl(
      _$VerifiedImpl _value, $Res Function(_$VerifiedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerifiedImpl implements _Verified {
  const _$VerifiedImpl();

  @override
  String toString() {
    return 'MainState.verified()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifiedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() logedOut,
    required TResult Function() notVerify,
    required TResult Function() verified,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    return verified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? logedOut,
    TResult? Function()? notVerify,
    TResult? Function()? verified,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    return verified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? logedOut,
    TResult Function()? notVerify,
    TResult Function()? verified,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_NotVerify value) notVerify,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return verified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_NotVerify value)? notVerify,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return verified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_NotVerify value)? notVerify,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(this);
    }
    return orElse();
  }
}

abstract class _Verified implements MainState {
  const factory _Verified() = _$VerifiedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(_$ErrorImpl(
      apiErrorModel: null == apiErrorModel
          ? _value.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.apiErrorModel});

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'MainState.error(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() logedOut,
    required TResult Function() notVerify,
    required TResult Function() verified,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    return error(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? logedOut,
    TResult? Function()? notVerify,
    TResult? Function()? verified,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    return error?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? logedOut,
    TResult Function()? notVerify,
    TResult Function()? verified,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_NotVerify value) notVerify,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_NotVerify value)? notVerify,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_NotVerify value)? notVerify,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MainState {
  const factory _Error({required final ApiErrorModel apiErrorModel}) =
      _$ErrorImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
