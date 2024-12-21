// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as bool?,
      onlineOffline: json['online_offline'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'online_offline': instance.onlineOffline,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'password': instance.password,
      'email': instance.email,
      'image': instance.image,
      'address': instance.address,
      'phone': instance.phone,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
