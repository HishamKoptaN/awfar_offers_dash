// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_offer_group_req_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddOfferGroupReqBodyModelImpl _$$AddOfferGroupReqBodyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddOfferGroupReqBodyModelImpl(
      name: json['name'] as String?,
      storeId: (json['store_id'] as num?)?.toInt(),
      startAt: json['start_at'] == null
          ? null
          : DateTime.parse(json['start_at'] as String),
      endAt: json['end_at'] == null
          ? null
          : DateTime.parse(json['end_at'] as String),
    );

Map<String, dynamic> _$$AddOfferGroupReqBodyModelImplToJson(
        _$AddOfferGroupReqBodyModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'store_id': instance.storeId,
      'start_at': instance.startAt?.toIso8601String(),
      'end_at': instance.endAt?.toIso8601String(),
    };
