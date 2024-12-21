// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'external_notifications_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExternalNotificationsEvent {
  ExternalNotification get externalNotification =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExternalNotification externalNotification) add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExternalNotification externalNotification)? add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExternalNotification externalNotification)? add,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ExternalNotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExternalNotificationsEventCopyWith<ExternalNotificationsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalNotificationsEventCopyWith<$Res> {
  factory $ExternalNotificationsEventCopyWith(ExternalNotificationsEvent value,
          $Res Function(ExternalNotificationsEvent) then) =
      _$ExternalNotificationsEventCopyWithImpl<$Res,
          ExternalNotificationsEvent>;
  @useResult
  $Res call({ExternalNotification externalNotification});

  $ExternalNotificationCopyWith<$Res> get externalNotification;
}

/// @nodoc
class _$ExternalNotificationsEventCopyWithImpl<$Res,
        $Val extends ExternalNotificationsEvent>
    implements $ExternalNotificationsEventCopyWith<$Res> {
  _$ExternalNotificationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExternalNotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? externalNotification = null,
  }) {
    return _then(_value.copyWith(
      externalNotification: null == externalNotification
          ? _value.externalNotification
          : externalNotification // ignore: cast_nullable_to_non_nullable
              as ExternalNotification,
    ) as $Val);
  }

  /// Create a copy of ExternalNotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExternalNotificationCopyWith<$Res> get externalNotification {
    return $ExternalNotificationCopyWith<$Res>(_value.externalNotification,
        (value) {
      return _then(_value.copyWith(externalNotification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res>
    implements $ExternalNotificationsEventCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExternalNotification externalNotification});

  @override
  $ExternalNotificationCopyWith<$Res> get externalNotification;
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$ExternalNotificationsEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExternalNotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? externalNotification = null,
  }) {
    return _then(_$AddImpl(
      externalNotification: null == externalNotification
          ? _value.externalNotification
          : externalNotification // ignore: cast_nullable_to_non_nullable
              as ExternalNotification,
    ));
  }
}

/// @nodoc

class _$AddImpl implements _Add {
  const _$AddImpl({required this.externalNotification});

  @override
  final ExternalNotification externalNotification;

  @override
  String toString() {
    return 'ExternalNotificationsEvent.add(externalNotification: $externalNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.externalNotification, externalNotification) ||
                other.externalNotification == externalNotification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, externalNotification);

  /// Create a copy of ExternalNotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExternalNotification externalNotification) add,
  }) {
    return add(externalNotification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExternalNotification externalNotification)? add,
  }) {
    return add?.call(externalNotification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExternalNotification externalNotification)? add,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(externalNotification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements ExternalNotificationsEvent {
  const factory _Add(
      {required final ExternalNotification externalNotification}) = _$AddImpl;

  @override
  ExternalNotification get externalNotification;

  /// Create a copy of ExternalNotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
