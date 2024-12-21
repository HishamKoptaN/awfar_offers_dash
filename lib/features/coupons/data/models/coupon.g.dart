// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponImpl _$$CouponImplFromJson(Map<String, dynamic> json) => _$CouponImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? "",
      storeId: (json['store_id'] as num?)?.toInt() ?? 0,
      categoryId: (json['category_id'] as num?)?.toInt() ?? 0,
      url: json['url'] as String? ?? "",
      description: json['description'] as String? ?? "",
      isWork: json['is_work'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? "",
      updatedAt: json['updated_at'] as String? ?? "",
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CouponImplToJson(_$CouponImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'store_id': instance.storeId,
      'category_id': instance.categoryId,
      'url': instance.url,
      'description': instance.description,
      'is_work': instance.isWork,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'store': instance.store,
    };
