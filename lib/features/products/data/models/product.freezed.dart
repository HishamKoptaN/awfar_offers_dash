// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_rate")
  String? get discountRate => throw _privateConstructorUsedError;
  @JsonKey(name: "offer_id")
  int? get offerId => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_category_item_id")
  int? get subCategoryItemId => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "amount_saved")
  String? get amountSaved => throw _privateConstructorUsedError;
  @JsonKey(name: "price_after_discount")
  String? get priceAfterDiscount => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "price") String? price,
      @JsonKey(name: "discount_rate") String? discountRate,
      @JsonKey(name: "offer_id") int? offerId,
      @JsonKey(name: "sub_category_item_id") int? subCategoryItemId,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "amount_saved") String? amountSaved,
      @JsonKey(name: "price_after_discount") String? priceAfterDiscount});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? discountRate = freezed,
    Object? offerId = freezed,
    Object? subCategoryItemId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? amountSaved = freezed,
    Object? priceAfterDiscount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      discountRate: freezed == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as String?,
      offerId: freezed == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int?,
      subCategoryItemId: freezed == subCategoryItemId
          ? _value.subCategoryItemId
          : subCategoryItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      amountSaved: freezed == amountSaved
          ? _value.amountSaved
          : amountSaved // ignore: cast_nullable_to_non_nullable
              as String?,
      priceAfterDiscount: freezed == priceAfterDiscount
          ? _value.priceAfterDiscount
          : priceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "price") String? price,
      @JsonKey(name: "discount_rate") String? discountRate,
      @JsonKey(name: "offer_id") int? offerId,
      @JsonKey(name: "sub_category_item_id") int? subCategoryItemId,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "amount_saved") String? amountSaved,
      @JsonKey(name: "price_after_discount") String? priceAfterDiscount});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? discountRate = freezed,
    Object? offerId = freezed,
    Object? subCategoryItemId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? amountSaved = freezed,
    Object? priceAfterDiscount = freezed,
  }) {
    return _then(_$ProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      discountRate: freezed == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as String?,
      offerId: freezed == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int?,
      subCategoryItemId: freezed == subCategoryItemId
          ? _value.subCategoryItemId
          : subCategoryItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      amountSaved: freezed == amountSaved
          ? _value.amountSaved
          : amountSaved // ignore: cast_nullable_to_non_nullable
              as String?,
      priceAfterDiscount: freezed == priceAfterDiscount
          ? _value.priceAfterDiscount
          : priceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "discount_rate") this.discountRate,
      @JsonKey(name: "offer_id") this.offerId,
      @JsonKey(name: "sub_category_item_id") this.subCategoryItemId,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "amount_saved") this.amountSaved,
      @JsonKey(name: "price_after_discount") this.priceAfterDiscount});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "price")
  final String? price;
  @override
  @JsonKey(name: "discount_rate")
  final String? discountRate;
  @override
  @JsonKey(name: "offer_id")
  final int? offerId;
  @override
  @JsonKey(name: "sub_category_item_id")
  final int? subCategoryItemId;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  @JsonKey(name: "amount_saved")
  final String? amountSaved;
  @override
  @JsonKey(name: "price_after_discount")
  final String? priceAfterDiscount;

  @override
  String toString() {
    return 'Product(id: $id, image: $image, price: $price, discountRate: $discountRate, offerId: $offerId, subCategoryItemId: $subCategoryItemId, createdAt: $createdAt, updatedAt: $updatedAt, amountSaved: $amountSaved, priceAfterDiscount: $priceAfterDiscount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountRate, discountRate) ||
                other.discountRate == discountRate) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.subCategoryItemId, subCategoryItemId) ||
                other.subCategoryItemId == subCategoryItemId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.amountSaved, amountSaved) ||
                other.amountSaved == amountSaved) &&
            (identical(other.priceAfterDiscount, priceAfterDiscount) ||
                other.priceAfterDiscount == priceAfterDiscount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      image,
      price,
      discountRate,
      offerId,
      subCategoryItemId,
      createdAt,
      updatedAt,
      amountSaved,
      priceAfterDiscount);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "image") final String? image,
      @JsonKey(name: "price") final String? price,
      @JsonKey(name: "discount_rate") final String? discountRate,
      @JsonKey(name: "offer_id") final int? offerId,
      @JsonKey(name: "sub_category_item_id") final int? subCategoryItemId,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "updated_at") final String? updatedAt,
      @JsonKey(name: "amount_saved") final String? amountSaved,
      @JsonKey(name: "price_after_discount")
      final String? priceAfterDiscount}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "price")
  String? get price;
  @override
  @JsonKey(name: "discount_rate")
  String? get discountRate;
  @override
  @JsonKey(name: "offer_id")
  int? get offerId;
  @override
  @JsonKey(name: "sub_category_item_id")
  int? get subCategoryItemId;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(name: "amount_saved")
  String? get amountSaved;
  @override
  @JsonKey(name: "price_after_discount")
  String? get priceAfterDiscount;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
