// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marka.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarkaImpl _$$MarkaImplFromJson(Map<String, dynamic> json) => _$MarkaImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      subCategoryId: (json['sub_category_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$MarkaImplToJson(_$MarkaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sub_category_id': instance.subCategoryId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
