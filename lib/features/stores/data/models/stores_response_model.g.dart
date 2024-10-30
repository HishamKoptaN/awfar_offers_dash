// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      countryId: (json['country_id'] as num?)?.toInt(),
      governorateId: (json['governorate_id'] as num?)?.toInt(),
      place: json['place'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'country_id': instance.countryId,
      'governorate_id': instance.governorateId,
      'place': instance.place,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
