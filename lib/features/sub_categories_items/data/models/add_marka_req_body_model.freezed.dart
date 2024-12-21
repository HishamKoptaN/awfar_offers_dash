// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_marka_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddMarkaReqBodyModel _$AddMarkaReqBodyModelFromJson(Map<String, dynamic> json) {
  return _AddMarkaReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$AddMarkaReqBodyModel {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_category_id")
  int? get subCategoryId => throw _privateConstructorUsedError;

  /// Serializes this AddMarkaReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddMarkaReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddMarkaReqBodyModelCopyWith<AddMarkaReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMarkaReqBodyModelCopyWith<$Res> {
  factory $AddMarkaReqBodyModelCopyWith(AddMarkaReqBodyModel value,
          $Res Function(AddMarkaReqBodyModel) then) =
      _$AddMarkaReqBodyModelCopyWithImpl<$Res, AddMarkaReqBodyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "sub_category_id") int? subCategoryId});
}

/// @nodoc
class _$AddMarkaReqBodyModelCopyWithImpl<$Res,
        $Val extends AddMarkaReqBodyModel>
    implements $AddMarkaReqBodyModelCopyWith<$Res> {
  _$AddMarkaReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddMarkaReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? subCategoryId = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryId: freezed == subCategoryId
          ? _value.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddMarkaReqBodyModelImplCopyWith<$Res>
    implements $AddMarkaReqBodyModelCopyWith<$Res> {
  factory _$$AddMarkaReqBodyModelImplCopyWith(_$AddMarkaReqBodyModelImpl value,
          $Res Function(_$AddMarkaReqBodyModelImpl) then) =
      __$$AddMarkaReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "sub_category_id") int? subCategoryId});
}

/// @nodoc
class __$$AddMarkaReqBodyModelImplCopyWithImpl<$Res>
    extends _$AddMarkaReqBodyModelCopyWithImpl<$Res, _$AddMarkaReqBodyModelImpl>
    implements _$$AddMarkaReqBodyModelImplCopyWith<$Res> {
  __$$AddMarkaReqBodyModelImplCopyWithImpl(_$AddMarkaReqBodyModelImpl _value,
      $Res Function(_$AddMarkaReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddMarkaReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? subCategoryId = freezed,
  }) {
    return _then(_$AddMarkaReqBodyModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryId: freezed == subCategoryId
          ? _value.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddMarkaReqBodyModelImpl implements _AddMarkaReqBodyModel {
  const _$AddMarkaReqBodyModelImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "sub_category_id") this.subCategoryId});

  factory _$AddMarkaReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddMarkaReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "sub_category_id")
  final int? subCategoryId;

  @override
  String toString() {
    return 'AddMarkaReqBodyModel(name: $name, subCategoryId: $subCategoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMarkaReqBodyModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subCategoryId, subCategoryId) ||
                other.subCategoryId == subCategoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, subCategoryId);

  /// Create a copy of AddMarkaReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMarkaReqBodyModelImplCopyWith<_$AddMarkaReqBodyModelImpl>
      get copyWith =>
          __$$AddMarkaReqBodyModelImplCopyWithImpl<_$AddMarkaReqBodyModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddMarkaReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _AddMarkaReqBodyModel implements AddMarkaReqBodyModel {
  const factory _AddMarkaReqBodyModel(
          {@JsonKey(name: "name") final String? name,
          @JsonKey(name: "sub_category_id") final int? subCategoryId}) =
      _$AddMarkaReqBodyModelImpl;

  factory _AddMarkaReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$AddMarkaReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "sub_category_id")
  int? get subCategoryId;

  /// Create a copy of AddMarkaReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddMarkaReqBodyModelImplCopyWith<_$AddMarkaReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
