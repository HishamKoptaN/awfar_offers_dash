// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferImpl _$$OfferImplFromJson(Map<String, dynamic> json) => _$OfferImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      storeId: (json['store_id'] as num).toInt(),
      subCategoryId: (json['sub_category_id'] as num).toInt(),
      description: json['description'] as String,
      image: json['image'] as String,
      endAt: json['end_at'],
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$OfferImplToJson(_$OfferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'store_id': instance.storeId,
      'sub_category_id': instance.subCategoryId,
      'description': instance.description,
      'image': instance.image,
      'end_at': instance.endAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
