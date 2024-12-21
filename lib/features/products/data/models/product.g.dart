// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      price: json['price'] as String?,
      discountRate: json['discount_rate'] as String?,
      offerId: (json['offer_id'] as num?)?.toInt(),
      subCategoryItemId: (json['sub_category_item_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      amountSaved: json['amount_saved'] as String?,
      priceAfterDiscount: json['price_after_discount'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'price': instance.price,
      'discount_rate': instance.discountRate,
      'offer_id': instance.offerId,
      'sub_category_item_id': instance.subCategoryItemId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'amount_saved': instance.amountSaved,
      'price_after_discount': instance.priceAfterDiscount,
    };
