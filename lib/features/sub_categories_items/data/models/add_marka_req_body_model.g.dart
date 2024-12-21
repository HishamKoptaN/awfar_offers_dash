// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_marka_req_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddMarkaReqBodyModelImpl _$$AddMarkaReqBodyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddMarkaReqBodyModelImpl(
      name: json['name'] as String?,
      subCategoryId: (json['sub_category_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddMarkaReqBodyModelImplToJson(
        _$AddMarkaReqBodyModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sub_category_id': instance.subCategoryId,
    };
