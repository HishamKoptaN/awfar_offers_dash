// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'governorates_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Governorate _$GovernorateFromJson(Map<String, dynamic> json) {
  return _Governorate.fromJson(json);
}

/// @nodoc
mixin _$Governorate {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "country_id")
  int? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Governorate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Governorate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GovernorateCopyWith<Governorate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GovernorateCopyWith<$Res> {
  factory $GovernorateCopyWith(
          Governorate value, $Res Function(Governorate) then) =
      _$GovernorateCopyWithImpl<$Res, Governorate>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "country_id") int? countryId,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt});
}

/// @nodoc
class _$GovernorateCopyWithImpl<$Res, $Val extends Governorate>
    implements $GovernorateCopyWith<$Res> {
  _$GovernorateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Governorate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? countryId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GovernorateImplCopyWith<$Res>
    implements $GovernorateCopyWith<$Res> {
  factory _$$GovernorateImplCopyWith(
          _$GovernorateImpl value, $Res Function(_$GovernorateImpl) then) =
      __$$GovernorateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "country_id") int? countryId,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt});
}

/// @nodoc
class __$$GovernorateImplCopyWithImpl<$Res>
    extends _$GovernorateCopyWithImpl<$Res, _$GovernorateImpl>
    implements _$$GovernorateImplCopyWith<$Res> {
  __$$GovernorateImplCopyWithImpl(
      _$GovernorateImpl _value, $Res Function(_$GovernorateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Governorate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? countryId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$GovernorateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GovernorateImpl implements _Governorate {
  const _$GovernorateImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "country_id") this.countryId,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$GovernorateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GovernorateImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "country_id")
  final int? countryId;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  @override
  String toString() {
    return 'Governorate(id: $id, name: $name, countryId: $countryId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GovernorateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, countryId, createdAt, updatedAt);

  /// Create a copy of Governorate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GovernorateImplCopyWith<_$GovernorateImpl> get copyWith =>
      __$$GovernorateImplCopyWithImpl<_$GovernorateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GovernorateImplToJson(
      this,
    );
  }
}

abstract class _Governorate implements Governorate {
  const factory _Governorate(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "name") final String? name,
          @JsonKey(name: "country_id") final int? countryId,
          @JsonKey(name: "created_at") final String? createdAt,
          @JsonKey(name: "updated_at") final String? updatedAt}) =
      _$GovernorateImpl;

  factory _Governorate.fromJson(Map<String, dynamic> json) =
      _$GovernorateImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "country_id")
  int? get countryId;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;

  /// Create a copy of Governorate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GovernorateImplCopyWith<_$GovernorateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
