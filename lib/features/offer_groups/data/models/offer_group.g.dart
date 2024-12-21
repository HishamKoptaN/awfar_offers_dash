// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferGroupImpl _$$OfferGroupImplFromJson(Map<String, dynamic> json) =>
    _$OfferGroupImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as bool?,
      name: json['name'] as String?,
      storeId: (json['store_id'] as num?)?.toInt(),
      startAt: json['start_at'],
      endAt: json['end_at'] == null
          ? null
          : DateTime.parse(json['end_at'] as String),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      daysRemaining: json['days_remaining'] as String?,
      offers: (json['offers'] as List<dynamic>?)
          ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OfferGroupImplToJson(_$OfferGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'name': instance.name,
      'store_id': instance.storeId,
      'start_at': instance.startAt,
      'end_at': instance.endAt?.toIso8601String(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'days_remaining': instance.daysRemaining,
      'offers': instance.offers,
    };
