// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityImpl _$$CityImplFromJson(Map<String, dynamic> json) => _$CityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      countryId: (json['country_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$CityImplToJson(_$CityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.countryId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
