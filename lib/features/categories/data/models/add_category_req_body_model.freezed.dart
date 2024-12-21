// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_category_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddCategoryReqBodyModel _$AddCategoryReqBodyModelFromJson(
    Map<String, dynamic> json) {
  return _AddCategoryReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$AddCategoryReqBodyModel {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this AddCategoryReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddCategoryReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddCategoryReqBodyModelCopyWith<AddCategoryReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCategoryReqBodyModelCopyWith<$Res> {
  factory $AddCategoryReqBodyModelCopyWith(AddCategoryReqBodyModel value,
          $Res Function(AddCategoryReqBodyModel) then) =
      _$AddCategoryReqBodyModelCopyWithImpl<$Res, AddCategoryReqBodyModel>;
  @useResult
  $Res call({@JsonKey(name: "name") String? name});
}

/// @nodoc
class _$AddCategoryReqBodyModelCopyWithImpl<$Res,
        $Val extends AddCategoryReqBodyModel>
    implements $AddCategoryReqBodyModelCopyWith<$Res> {
  _$AddCategoryReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddCategoryReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCategoryReqBodyModelImplCopyWith<$Res>
    implements $AddCategoryReqBodyModelCopyWith<$Res> {
  factory _$$AddCategoryReqBodyModelImplCopyWith(
          _$AddCategoryReqBodyModelImpl value,
          $Res Function(_$AddCategoryReqBodyModelImpl) then) =
      __$$AddCategoryReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "name") String? name});
}

/// @nodoc
class __$$AddCategoryReqBodyModelImplCopyWithImpl<$Res>
    extends _$AddCategoryReqBodyModelCopyWithImpl<$Res,
        _$AddCategoryReqBodyModelImpl>
    implements _$$AddCategoryReqBodyModelImplCopyWith<$Res> {
  __$$AddCategoryReqBodyModelImplCopyWithImpl(
      _$AddCategoryReqBodyModelImpl _value,
      $Res Function(_$AddCategoryReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddCategoryReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$AddCategoryReqBodyModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddCategoryReqBodyModelImpl implements _AddCategoryReqBodyModel {
  const _$AddCategoryReqBodyModelImpl({@JsonKey(name: "name") this.name});

  factory _$AddCategoryReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddCategoryReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;

  @override
  String toString() {
    return 'AddCategoryReqBodyModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCategoryReqBodyModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of AddCategoryReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCategoryReqBodyModelImplCopyWith<_$AddCategoryReqBodyModelImpl>
      get copyWith => __$$AddCategoryReqBodyModelImplCopyWithImpl<
          _$AddCategoryReqBodyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddCategoryReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _AddCategoryReqBodyModel implements AddCategoryReqBodyModel {
  const factory _AddCategoryReqBodyModel(
          {@JsonKey(name: "name") final String? name}) =
      _$AddCategoryReqBodyModelImpl;

  factory _AddCategoryReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$AddCategoryReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;

  /// Create a copy of AddCategoryReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCategoryReqBodyModelImplCopyWith<_$AddCategoryReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
