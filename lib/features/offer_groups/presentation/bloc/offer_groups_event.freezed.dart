// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_groups_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OfferGroupsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int storeId) get,
    required TResult Function(
            AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)
        add,
    required TResult Function(int id) delete,
    required TResult Function(OfferGroup offerGroup) edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int storeId)? get,
    TResult? Function(AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)? add,
    TResult? Function(int id)? delete,
    TResult? Function(OfferGroup offerGroup)? edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int storeId)? get,
    TResult Function(AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)? add,
    TResult Function(int id)? delete,
    TResult Function(OfferGroup offerGroup)? edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Edit value) edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Get value)? get,
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Edit value)? edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferGroupsEventCopyWith<$Res> {
  factory $OfferGroupsEventCopyWith(
          OfferGroupsEvent value, $Res Function(OfferGroupsEvent) then) =
      _$OfferGroupsEventCopyWithImpl<$Res, OfferGroupsEvent>;
}

/// @nodoc
class _$OfferGroupsEventCopyWithImpl<$Res, $Val extends OfferGroupsEvent>
    implements $OfferGroupsEventCopyWith<$Res> {
  _$OfferGroupsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetImplCopyWith<$Res> {
  factory _$$GetImplCopyWith(_$GetImpl value, $Res Function(_$GetImpl) then) =
      __$$GetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int storeId});
}

/// @nodoc
class __$$GetImplCopyWithImpl<$Res>
    extends _$OfferGroupsEventCopyWithImpl<$Res, _$GetImpl>
    implements _$$GetImplCopyWith<$Res> {
  __$$GetImplCopyWithImpl(_$GetImpl _value, $Res Function(_$GetImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
  }) {
    return _then(_$GetImpl(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetImpl implements _Get {
  const _$GetImpl({required this.storeId});

  @override
  final int storeId;

  @override
  String toString() {
    return 'OfferGroupsEvent.get(storeId: $storeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetImpl &&
            (identical(other.storeId, storeId) || other.storeId == storeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storeId);

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetImplCopyWith<_$GetImpl> get copyWith =>
      __$$GetImplCopyWithImpl<_$GetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int storeId) get,
    required TResult Function(
            AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)
        add,
    required TResult Function(int id) delete,
    required TResult Function(OfferGroup offerGroup) edit,
  }) {
    return get(storeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int storeId)? get,
    TResult? Function(AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)? add,
    TResult? Function(int id)? delete,
    TResult? Function(OfferGroup offerGroup)? edit,
  }) {
    return get?.call(storeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int storeId)? get,
    TResult Function(AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)? add,
    TResult Function(int id)? delete,
    TResult Function(OfferGroup offerGroup)? edit,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(storeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Edit value) edit,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Get value)? get,
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Edit value)? edit,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class _Get implements OfferGroupsEvent {
  const factory _Get({required final int storeId}) = _$GetImpl;

  int get storeId;

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetImplCopyWith<_$GetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddOfferGroupReqBodyModel addOfferGroupReqBodyModel});

  $AddOfferGroupReqBodyModelCopyWith<$Res> get addOfferGroupReqBodyModel;
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$OfferGroupsEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addOfferGroupReqBodyModel = null,
  }) {
    return _then(_$AddImpl(
      addOfferGroupReqBodyModel: null == addOfferGroupReqBodyModel
          ? _value.addOfferGroupReqBodyModel
          : addOfferGroupReqBodyModel // ignore: cast_nullable_to_non_nullable
              as AddOfferGroupReqBodyModel,
    ));
  }

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddOfferGroupReqBodyModelCopyWith<$Res> get addOfferGroupReqBodyModel {
    return $AddOfferGroupReqBodyModelCopyWith<$Res>(
        _value.addOfferGroupReqBodyModel, (value) {
      return _then(_value.copyWith(addOfferGroupReqBodyModel: value));
    });
  }
}

/// @nodoc

class _$AddImpl implements _Add {
  const _$AddImpl({required this.addOfferGroupReqBodyModel});

  @override
  final AddOfferGroupReqBodyModel addOfferGroupReqBodyModel;

  @override
  String toString() {
    return 'OfferGroupsEvent.add(addOfferGroupReqBodyModel: $addOfferGroupReqBodyModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.addOfferGroupReqBodyModel,
                    addOfferGroupReqBodyModel) ||
                other.addOfferGroupReqBodyModel == addOfferGroupReqBodyModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addOfferGroupReqBodyModel);

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int storeId) get,
    required TResult Function(
            AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)
        add,
    required TResult Function(int id) delete,
    required TResult Function(OfferGroup offerGroup) edit,
  }) {
    return add(addOfferGroupReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int storeId)? get,
    TResult? Function(AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)? add,
    TResult? Function(int id)? delete,
    TResult? Function(OfferGroup offerGroup)? edit,
  }) {
    return add?.call(addOfferGroupReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int storeId)? get,
    TResult Function(AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)? add,
    TResult Function(int id)? delete,
    TResult Function(OfferGroup offerGroup)? edit,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(addOfferGroupReqBodyModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Edit value) edit,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Get value)? get,
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Edit value)? edit,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements OfferGroupsEvent {
  const factory _Add(
      {required final AddOfferGroupReqBodyModel
          addOfferGroupReqBodyModel}) = _$AddImpl;

  AddOfferGroupReqBodyModel get addOfferGroupReqBodyModel;

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$OfferGroupsEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'OfferGroupsEvent.delete(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int storeId) get,
    required TResult Function(
            AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)
        add,
    required TResult Function(int id) delete,
    required TResult Function(OfferGroup offerGroup) edit,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int storeId)? get,
    TResult? Function(AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)? add,
    TResult? Function(int id)? delete,
    TResult? Function(OfferGroup offerGroup)? edit,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int storeId)? get,
    TResult Function(AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)? add,
    TResult Function(int id)? delete,
    TResult Function(OfferGroup offerGroup)? edit,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Edit value) edit,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Get value)? get,
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Edit value)? edit,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements OfferGroupsEvent {
  const factory _Delete({required final int id}) = _$DeleteImpl;

  int get id;

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditImplCopyWith<$Res> {
  factory _$$EditImplCopyWith(
          _$EditImpl value, $Res Function(_$EditImpl) then) =
      __$$EditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OfferGroup offerGroup});

  $OfferGroupCopyWith<$Res> get offerGroup;
}

/// @nodoc
class __$$EditImplCopyWithImpl<$Res>
    extends _$OfferGroupsEventCopyWithImpl<$Res, _$EditImpl>
    implements _$$EditImplCopyWith<$Res> {
  __$$EditImplCopyWithImpl(_$EditImpl _value, $Res Function(_$EditImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerGroup = null,
  }) {
    return _then(_$EditImpl(
      offerGroup: null == offerGroup
          ? _value.offerGroup
          : offerGroup // ignore: cast_nullable_to_non_nullable
              as OfferGroup,
    ));
  }

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferGroupCopyWith<$Res> get offerGroup {
    return $OfferGroupCopyWith<$Res>(_value.offerGroup, (value) {
      return _then(_value.copyWith(offerGroup: value));
    });
  }
}

/// @nodoc

class _$EditImpl implements _Edit {
  const _$EditImpl({required this.offerGroup});

  @override
  final OfferGroup offerGroup;

  @override
  String toString() {
    return 'OfferGroupsEvent.edit(offerGroup: $offerGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditImpl &&
            (identical(other.offerGroup, offerGroup) ||
                other.offerGroup == offerGroup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, offerGroup);

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      __$$EditImplCopyWithImpl<_$EditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int storeId) get,
    required TResult Function(
            AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)
        add,
    required TResult Function(int id) delete,
    required TResult Function(OfferGroup offerGroup) edit,
  }) {
    return edit(offerGroup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int storeId)? get,
    TResult? Function(AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)? add,
    TResult? Function(int id)? delete,
    TResult? Function(OfferGroup offerGroup)? edit,
  }) {
    return edit?.call(offerGroup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int storeId)? get,
    TResult Function(AddOfferGroupReqBodyModel addOfferGroupReqBodyModel)? add,
    TResult Function(int id)? delete,
    TResult Function(OfferGroup offerGroup)? edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(offerGroup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Edit value) edit,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Get value)? get,
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Edit value)? edit,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _Edit implements OfferGroupsEvent {
  const factory _Edit({required final OfferGroup offerGroup}) = _$EditImpl;

  OfferGroup get offerGroup;

  /// Create a copy of OfferGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
