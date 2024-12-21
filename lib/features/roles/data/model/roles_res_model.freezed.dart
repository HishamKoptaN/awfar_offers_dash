// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roles_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RolesResModel _$RolesResModelFromJson(Map<String, dynamic> json) {
  return _RolesResModel.fromJson(json);
}

/// @nodoc
mixin _$RolesResModel {
  @JsonKey(name: "user_roles")
  List<Role>? get userRoles => throw _privateConstructorUsedError;
  @JsonKey(name: "roles")
  List<Role>? get roles => throw _privateConstructorUsedError;

  /// Serializes this RolesResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RolesResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RolesResModelCopyWith<RolesResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolesResModelCopyWith<$Res> {
  factory $RolesResModelCopyWith(
          RolesResModel value, $Res Function(RolesResModel) then) =
      _$RolesResModelCopyWithImpl<$Res, RolesResModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "user_roles") List<Role>? userRoles,
      @JsonKey(name: "roles") List<Role>? roles});
}

/// @nodoc
class _$RolesResModelCopyWithImpl<$Res, $Val extends RolesResModel>
    implements $RolesResModelCopyWith<$Res> {
  _$RolesResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RolesResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRoles = freezed,
    Object? roles = freezed,
  }) {
    return _then(_value.copyWith(
      userRoles: freezed == userRoles
          ? _value.userRoles
          : userRoles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RolesResModelImplCopyWith<$Res>
    implements $RolesResModelCopyWith<$Res> {
  factory _$$RolesResModelImplCopyWith(
          _$RolesResModelImpl value, $Res Function(_$RolesResModelImpl) then) =
      __$$RolesResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_roles") List<Role>? userRoles,
      @JsonKey(name: "roles") List<Role>? roles});
}

/// @nodoc
class __$$RolesResModelImplCopyWithImpl<$Res>
    extends _$RolesResModelCopyWithImpl<$Res, _$RolesResModelImpl>
    implements _$$RolesResModelImplCopyWith<$Res> {
  __$$RolesResModelImplCopyWithImpl(
      _$RolesResModelImpl _value, $Res Function(_$RolesResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RolesResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRoles = freezed,
    Object? roles = freezed,
  }) {
    return _then(_$RolesResModelImpl(
      userRoles: freezed == userRoles
          ? _value._userRoles
          : userRoles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RolesResModelImpl implements _RolesResModel {
  const _$RolesResModelImpl(
      {@JsonKey(name: "user_roles") final List<Role>? userRoles,
      @JsonKey(name: "roles") final List<Role>? roles})
      : _userRoles = userRoles,
        _roles = roles;

  factory _$RolesResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RolesResModelImplFromJson(json);

  final List<Role>? _userRoles;
  @override
  @JsonKey(name: "user_roles")
  List<Role>? get userRoles {
    final value = _userRoles;
    if (value == null) return null;
    if (_userRoles is EqualUnmodifiableListView) return _userRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Role>? _roles;
  @override
  @JsonKey(name: "roles")
  List<Role>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RolesResModel(userRoles: $userRoles, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RolesResModelImpl &&
            const DeepCollectionEquality()
                .equals(other._userRoles, _userRoles) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_userRoles),
      const DeepCollectionEquality().hash(_roles));

  /// Create a copy of RolesResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RolesResModelImplCopyWith<_$RolesResModelImpl> get copyWith =>
      __$$RolesResModelImplCopyWithImpl<_$RolesResModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RolesResModelImplToJson(
      this,
    );
  }
}

abstract class _RolesResModel implements RolesResModel {
  const factory _RolesResModel(
      {@JsonKey(name: "user_roles") final List<Role>? userRoles,
      @JsonKey(name: "roles") final List<Role>? roles}) = _$RolesResModelImpl;

  factory _RolesResModel.fromJson(Map<String, dynamic> json) =
      _$RolesResModelImpl.fromJson;

  @override
  @JsonKey(name: "user_roles")
  List<Role>? get userRoles;
  @override
  @JsonKey(name: "roles")
  List<Role>? get roles;

  /// Create a copy of RolesResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RolesResModelImplCopyWith<_$RolesResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
