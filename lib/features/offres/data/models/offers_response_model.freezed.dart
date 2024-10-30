// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OffersResponseModel {
  List<Offer> get offers => throw _privateConstructorUsedError;

  /// Create a copy of OffersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OffersResponseModelCopyWith<OffersResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersResponseModelCopyWith<$Res> {
  factory $OffersResponseModelCopyWith(
          OffersResponseModel value, $Res Function(OffersResponseModel) then) =
      _$OffersResponseModelCopyWithImpl<$Res, OffersResponseModel>;
  @useResult
  $Res call({List<Offer> offers});
}

/// @nodoc
class _$OffersResponseModelCopyWithImpl<$Res, $Val extends OffersResponseModel>
    implements $OffersResponseModelCopyWith<$Res> {
  _$OffersResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OffersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offers = null,
  }) {
    return _then(_value.copyWith(
      offers: null == offers
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<Offer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OffersResponseModelImplCopyWith<$Res>
    implements $OffersResponseModelCopyWith<$Res> {
  factory _$$OffersResponseModelImplCopyWith(_$OffersResponseModelImpl value,
          $Res Function(_$OffersResponseModelImpl) then) =
      __$$OffersResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Offer> offers});
}

/// @nodoc
class __$$OffersResponseModelImplCopyWithImpl<$Res>
    extends _$OffersResponseModelCopyWithImpl<$Res, _$OffersResponseModelImpl>
    implements _$$OffersResponseModelImplCopyWith<$Res> {
  __$$OffersResponseModelImplCopyWithImpl(_$OffersResponseModelImpl _value,
      $Res Function(_$OffersResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OffersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offers = null,
  }) {
    return _then(_$OffersResponseModelImpl(
      offers: null == offers
          ? _value._offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<Offer>,
    ));
  }
}

/// @nodoc

class _$OffersResponseModelImpl implements _OffersResponseModel {
  const _$OffersResponseModelImpl({required final List<Offer> offers})
      : _offers = offers;

  final List<Offer> _offers;
  @override
  List<Offer> get offers {
    if (_offers is EqualUnmodifiableListView) return _offers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offers);
  }

  @override
  String toString() {
    return 'OffersResponseModel(offers: $offers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OffersResponseModelImpl &&
            const DeepCollectionEquality().equals(other._offers, _offers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_offers));

  /// Create a copy of OffersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OffersResponseModelImplCopyWith<_$OffersResponseModelImpl> get copyWith =>
      __$$OffersResponseModelImplCopyWithImpl<_$OffersResponseModelImpl>(
          this, _$identity);

  @override
  List<Map<String, dynamic>> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

abstract class _OffersResponseModel implements OffersResponseModel {
  const factory _OffersResponseModel({required final List<Offer> offers}) =
      _$OffersResponseModelImpl;

  @override
  List<Offer> get offers;

  /// Create a copy of OffersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OffersResponseModelImplCopyWith<_$OffersResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return _Offer.fromJson(json);
}

/// @nodoc
mixin _$Offer {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  int get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: "category_id")
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: "end_at")
  dynamic get endAt => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Offer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferCopyWith<Offer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferCopyWith<$Res> {
  factory $OfferCopyWith(Offer value, $Res Function(Offer) then) =
      _$OfferCopyWithImpl<$Res, Offer>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "store_id") int storeId,
      @JsonKey(name: "category_id") int categoryId,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "image") String image,
      @JsonKey(name: "end_at") dynamic endAt,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt});
}

/// @nodoc
class _$OfferCopyWithImpl<$Res, $Val extends Offer>
    implements $OfferCopyWith<$Res> {
  _$OfferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? storeId = null,
    Object? categoryId = null,
    Object? description = null,
    Object? image = null,
    Object? endAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfferImplCopyWith<$Res> implements $OfferCopyWith<$Res> {
  factory _$$OfferImplCopyWith(
          _$OfferImpl value, $Res Function(_$OfferImpl) then) =
      __$$OfferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "store_id") int storeId,
      @JsonKey(name: "category_id") int categoryId,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "image") String image,
      @JsonKey(name: "end_at") dynamic endAt,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt});
}

/// @nodoc
class __$$OfferImplCopyWithImpl<$Res>
    extends _$OfferCopyWithImpl<$Res, _$OfferImpl>
    implements _$$OfferImplCopyWith<$Res> {
  __$$OfferImplCopyWithImpl(
      _$OfferImpl _value, $Res Function(_$OfferImpl) _then)
      : super(_value, _then);

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? storeId = null,
    Object? categoryId = null,
    Object? description = null,
    Object? image = null,
    Object? endAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OfferImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferImpl implements _Offer {
  const _$OfferImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "status") required this.status,
      @JsonKey(name: "store_id") required this.storeId,
      @JsonKey(name: "category_id") required this.categoryId,
      @JsonKey(name: "description") required this.description,
      @JsonKey(name: "image") required this.image,
      @JsonKey(name: "end_at") this.endAt,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt});

  factory _$OfferImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "store_id")
  final int storeId;
  @override
  @JsonKey(name: "category_id")
  final int categoryId;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "image")
  final String image;
  @override
  @JsonKey(name: "end_at")
  final dynamic endAt;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;

  @override
  String toString() {
    return 'Offer(id: $id, name: $name, status: $status, storeId: $storeId, categoryId: $categoryId, description: $description, image: $image, endAt: $endAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other.endAt, endAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      status,
      storeId,
      categoryId,
      description,
      image,
      const DeepCollectionEquality().hash(endAt),
      createdAt,
      updatedAt);

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferImplCopyWith<_$OfferImpl> get copyWith =>
      __$$OfferImplCopyWithImpl<_$OfferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferImplToJson(
      this,
    );
  }
}

abstract class _Offer implements Offer {
  const factory _Offer(
          {@JsonKey(name: "id") required final int id,
          @JsonKey(name: "name") required final String name,
          @JsonKey(name: "status") required final String status,
          @JsonKey(name: "store_id") required final int storeId,
          @JsonKey(name: "category_id") required final int categoryId,
          @JsonKey(name: "description") required final String description,
          @JsonKey(name: "image") required final String image,
          @JsonKey(name: "end_at") final dynamic endAt,
          @JsonKey(name: "created_at") required final String createdAt,
          @JsonKey(name: "updated_at") required final String updatedAt}) =
      _$OfferImpl;

  factory _Offer.fromJson(Map<String, dynamic> json) = _$OfferImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "store_id")
  int get storeId;
  @override
  @JsonKey(name: "category_id")
  int get categoryId;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "image")
  String get image;
  @override
  @JsonKey(name: "end_at")
  dynamic get endAt;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferImplCopyWith<_$OfferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
