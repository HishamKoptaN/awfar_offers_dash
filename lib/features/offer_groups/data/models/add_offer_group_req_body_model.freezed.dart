// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_offer_group_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddOfferGroupReqBodyModel _$AddOfferGroupReqBodyModelFromJson(
    Map<String, dynamic> json) {
  return _AddOfferGroupReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$AddOfferGroupReqBodyModel {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  int? get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: "start_at")
  DateTime? get startAt => throw _privateConstructorUsedError;
  @JsonKey(name: "end_at")
  DateTime? get endAt => throw _privateConstructorUsedError;

  /// Serializes this AddOfferGroupReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddOfferGroupReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddOfferGroupReqBodyModelCopyWith<AddOfferGroupReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOfferGroupReqBodyModelCopyWith<$Res> {
  factory $AddOfferGroupReqBodyModelCopyWith(AddOfferGroupReqBodyModel value,
          $Res Function(AddOfferGroupReqBodyModel) then) =
      _$AddOfferGroupReqBodyModelCopyWithImpl<$Res, AddOfferGroupReqBodyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "store_id") int? storeId,
      @JsonKey(name: "start_at") DateTime? startAt,
      @JsonKey(name: "end_at") DateTime? endAt});
}

/// @nodoc
class _$AddOfferGroupReqBodyModelCopyWithImpl<$Res,
        $Val extends AddOfferGroupReqBodyModel>
    implements $AddOfferGroupReqBodyModelCopyWith<$Res> {
  _$AddOfferGroupReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddOfferGroupReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? storeId = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddOfferGroupReqBodyModelImplCopyWith<$Res>
    implements $AddOfferGroupReqBodyModelCopyWith<$Res> {
  factory _$$AddOfferGroupReqBodyModelImplCopyWith(
          _$AddOfferGroupReqBodyModelImpl value,
          $Res Function(_$AddOfferGroupReqBodyModelImpl) then) =
      __$$AddOfferGroupReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "store_id") int? storeId,
      @JsonKey(name: "start_at") DateTime? startAt,
      @JsonKey(name: "end_at") DateTime? endAt});
}

/// @nodoc
class __$$AddOfferGroupReqBodyModelImplCopyWithImpl<$Res>
    extends _$AddOfferGroupReqBodyModelCopyWithImpl<$Res,
        _$AddOfferGroupReqBodyModelImpl>
    implements _$$AddOfferGroupReqBodyModelImplCopyWith<$Res> {
  __$$AddOfferGroupReqBodyModelImplCopyWithImpl(
      _$AddOfferGroupReqBodyModelImpl _value,
      $Res Function(_$AddOfferGroupReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddOfferGroupReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? storeId = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
  }) {
    return _then(_$AddOfferGroupReqBodyModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddOfferGroupReqBodyModelImpl implements _AddOfferGroupReqBodyModel {
  const _$AddOfferGroupReqBodyModelImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "store_id") this.storeId,
      @JsonKey(name: "start_at") this.startAt,
      @JsonKey(name: "end_at") this.endAt});

  factory _$AddOfferGroupReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddOfferGroupReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "store_id")
  final int? storeId;
  @override
  @JsonKey(name: "start_at")
  final DateTime? startAt;
  @override
  @JsonKey(name: "end_at")
  final DateTime? endAt;

  @override
  String toString() {
    return 'AddOfferGroupReqBodyModel(name: $name, storeId: $storeId, startAt: $startAt, endAt: $endAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOfferGroupReqBodyModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, storeId, startAt, endAt);

  /// Create a copy of AddOfferGroupReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOfferGroupReqBodyModelImplCopyWith<_$AddOfferGroupReqBodyModelImpl>
      get copyWith => __$$AddOfferGroupReqBodyModelImplCopyWithImpl<
          _$AddOfferGroupReqBodyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddOfferGroupReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _AddOfferGroupReqBodyModel implements AddOfferGroupReqBodyModel {
  const factory _AddOfferGroupReqBodyModel(
          {@JsonKey(name: "name") final String? name,
          @JsonKey(name: "store_id") final int? storeId,
          @JsonKey(name: "start_at") final DateTime? startAt,
          @JsonKey(name: "end_at") final DateTime? endAt}) =
      _$AddOfferGroupReqBodyModelImpl;

  factory _AddOfferGroupReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$AddOfferGroupReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "store_id")
  int? get storeId;
  @override
  @JsonKey(name: "start_at")
  DateTime? get startAt;
  @override
  @JsonKey(name: "end_at")
  DateTime? get endAt;

  /// Create a copy of AddOfferGroupReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddOfferGroupReqBodyModelImplCopyWith<_$AddOfferGroupReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
