// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stores_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoresEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getEvent,
    required TResult Function(FormData formData) addEvent,
    required TResult Function() deleteEvent,
    required TResult Function() updateEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getEvent,
    TResult? Function(FormData formData)? addEvent,
    TResult? Function()? deleteEvent,
    TResult? Function()? updateEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getEvent,
    TResult Function(FormData formData)? addEvent,
    TResult Function()? deleteEvent,
    TResult Function()? updateEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEvent value) getEvent,
    required TResult Function(_AddEvent value) addEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_UpdateEvent value) updateEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetEvent value)? getEvent,
    TResult? Function(_AddEvent value)? addEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_UpdateEvent value)? updateEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEvent value)? getEvent,
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_UpdateEvent value)? updateEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoresEventCopyWith<$Res> {
  factory $StoresEventCopyWith(
          StoresEvent value, $Res Function(StoresEvent) then) =
      _$StoresEventCopyWithImpl<$Res, StoresEvent>;
}

/// @nodoc
class _$StoresEventCopyWithImpl<$Res, $Val extends StoresEvent>
    implements $StoresEventCopyWith<$Res> {
  _$StoresEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoresEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetEventImplCopyWith<$Res> {
  factory _$$GetEventImplCopyWith(
          _$GetEventImpl value, $Res Function(_$GetEventImpl) then) =
      __$$GetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetEventImplCopyWithImpl<$Res>
    extends _$StoresEventCopyWithImpl<$Res, _$GetEventImpl>
    implements _$$GetEventImplCopyWith<$Res> {
  __$$GetEventImplCopyWithImpl(
      _$GetEventImpl _value, $Res Function(_$GetEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoresEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetEventImpl implements _GetEvent {
  const _$GetEventImpl();

  @override
  String toString() {
    return 'StoresEvent.getEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getEvent,
    required TResult Function(FormData formData) addEvent,
    required TResult Function() deleteEvent,
    required TResult Function() updateEvent,
  }) {
    return getEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getEvent,
    TResult? Function(FormData formData)? addEvent,
    TResult? Function()? deleteEvent,
    TResult? Function()? updateEvent,
  }) {
    return getEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getEvent,
    TResult Function(FormData formData)? addEvent,
    TResult Function()? deleteEvent,
    TResult Function()? updateEvent,
    required TResult orElse(),
  }) {
    if (getEvent != null) {
      return getEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEvent value) getEvent,
    required TResult Function(_AddEvent value) addEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_UpdateEvent value) updateEvent,
  }) {
    return getEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetEvent value)? getEvent,
    TResult? Function(_AddEvent value)? addEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_UpdateEvent value)? updateEvent,
  }) {
    return getEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEvent value)? getEvent,
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_UpdateEvent value)? updateEvent,
    required TResult orElse(),
  }) {
    if (getEvent != null) {
      return getEvent(this);
    }
    return orElse();
  }
}

abstract class _GetEvent implements StoresEvent {
  const factory _GetEvent() = _$GetEventImpl;
}

/// @nodoc
abstract class _$$AddEventImplCopyWith<$Res> {
  factory _$$AddEventImplCopyWith(
          _$AddEventImpl value, $Res Function(_$AddEventImpl) then) =
      __$$AddEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FormData formData});
}

/// @nodoc
class __$$AddEventImplCopyWithImpl<$Res>
    extends _$StoresEventCopyWithImpl<$Res, _$AddEventImpl>
    implements _$$AddEventImplCopyWith<$Res> {
  __$$AddEventImplCopyWithImpl(
      _$AddEventImpl _value, $Res Function(_$AddEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoresEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formData = null,
  }) {
    return _then(_$AddEventImpl(
      formData: null == formData
          ? _value.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as FormData,
    ));
  }
}

/// @nodoc

class _$AddEventImpl implements _AddEvent {
  const _$AddEventImpl({required this.formData});

  @override
  final FormData formData;

  @override
  String toString() {
    return 'StoresEvent.addEvent(formData: $formData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddEventImpl &&
            (identical(other.formData, formData) ||
                other.formData == formData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formData);

  /// Create a copy of StoresEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddEventImplCopyWith<_$AddEventImpl> get copyWith =>
      __$$AddEventImplCopyWithImpl<_$AddEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getEvent,
    required TResult Function(FormData formData) addEvent,
    required TResult Function() deleteEvent,
    required TResult Function() updateEvent,
  }) {
    return addEvent(formData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getEvent,
    TResult? Function(FormData formData)? addEvent,
    TResult? Function()? deleteEvent,
    TResult? Function()? updateEvent,
  }) {
    return addEvent?.call(formData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getEvent,
    TResult Function(FormData formData)? addEvent,
    TResult Function()? deleteEvent,
    TResult Function()? updateEvent,
    required TResult orElse(),
  }) {
    if (addEvent != null) {
      return addEvent(formData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEvent value) getEvent,
    required TResult Function(_AddEvent value) addEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_UpdateEvent value) updateEvent,
  }) {
    return addEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetEvent value)? getEvent,
    TResult? Function(_AddEvent value)? addEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_UpdateEvent value)? updateEvent,
  }) {
    return addEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEvent value)? getEvent,
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_UpdateEvent value)? updateEvent,
    required TResult orElse(),
  }) {
    if (addEvent != null) {
      return addEvent(this);
    }
    return orElse();
  }
}

abstract class _AddEvent implements StoresEvent {
  const factory _AddEvent({required final FormData formData}) = _$AddEventImpl;

  FormData get formData;

  /// Create a copy of StoresEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddEventImplCopyWith<_$AddEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteEventImplCopyWith<$Res> {
  factory _$$DeleteEventImplCopyWith(
          _$DeleteEventImpl value, $Res Function(_$DeleteEventImpl) then) =
      __$$DeleteEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteEventImplCopyWithImpl<$Res>
    extends _$StoresEventCopyWithImpl<$Res, _$DeleteEventImpl>
    implements _$$DeleteEventImplCopyWith<$Res> {
  __$$DeleteEventImplCopyWithImpl(
      _$DeleteEventImpl _value, $Res Function(_$DeleteEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoresEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteEventImpl implements _DeleteEvent {
  const _$DeleteEventImpl();

  @override
  String toString() {
    return 'StoresEvent.deleteEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getEvent,
    required TResult Function(FormData formData) addEvent,
    required TResult Function() deleteEvent,
    required TResult Function() updateEvent,
  }) {
    return deleteEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getEvent,
    TResult? Function(FormData formData)? addEvent,
    TResult? Function()? deleteEvent,
    TResult? Function()? updateEvent,
  }) {
    return deleteEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getEvent,
    TResult Function(FormData formData)? addEvent,
    TResult Function()? deleteEvent,
    TResult Function()? updateEvent,
    required TResult orElse(),
  }) {
    if (deleteEvent != null) {
      return deleteEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEvent value) getEvent,
    required TResult Function(_AddEvent value) addEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_UpdateEvent value) updateEvent,
  }) {
    return deleteEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetEvent value)? getEvent,
    TResult? Function(_AddEvent value)? addEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_UpdateEvent value)? updateEvent,
  }) {
    return deleteEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEvent value)? getEvent,
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_UpdateEvent value)? updateEvent,
    required TResult orElse(),
  }) {
    if (deleteEvent != null) {
      return deleteEvent(this);
    }
    return orElse();
  }
}

abstract class _DeleteEvent implements StoresEvent {
  const factory _DeleteEvent() = _$DeleteEventImpl;
}

/// @nodoc
abstract class _$$UpdateEventImplCopyWith<$Res> {
  factory _$$UpdateEventImplCopyWith(
          _$UpdateEventImpl value, $Res Function(_$UpdateEventImpl) then) =
      __$$UpdateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateEventImplCopyWithImpl<$Res>
    extends _$StoresEventCopyWithImpl<$Res, _$UpdateEventImpl>
    implements _$$UpdateEventImplCopyWith<$Res> {
  __$$UpdateEventImplCopyWithImpl(
      _$UpdateEventImpl _value, $Res Function(_$UpdateEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoresEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateEventImpl implements _UpdateEvent {
  const _$UpdateEventImpl();

  @override
  String toString() {
    return 'StoresEvent.updateEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getEvent,
    required TResult Function(FormData formData) addEvent,
    required TResult Function() deleteEvent,
    required TResult Function() updateEvent,
  }) {
    return updateEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getEvent,
    TResult? Function(FormData formData)? addEvent,
    TResult? Function()? deleteEvent,
    TResult? Function()? updateEvent,
  }) {
    return updateEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getEvent,
    TResult Function(FormData formData)? addEvent,
    TResult Function()? deleteEvent,
    TResult Function()? updateEvent,
    required TResult orElse(),
  }) {
    if (updateEvent != null) {
      return updateEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEvent value) getEvent,
    required TResult Function(_AddEvent value) addEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_UpdateEvent value) updateEvent,
  }) {
    return updateEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetEvent value)? getEvent,
    TResult? Function(_AddEvent value)? addEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_UpdateEvent value)? updateEvent,
  }) {
    return updateEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEvent value)? getEvent,
    TResult Function(_AddEvent value)? addEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_UpdateEvent value)? updateEvent,
    required TResult orElse(),
  }) {
    if (updateEvent != null) {
      return updateEvent(this);
    }
    return orElse();
  }
}

abstract class _UpdateEvent implements StoresEvent {
  const factory _UpdateEvent() = _$UpdateEventImpl;
}
