// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckResponseModelImpl _$$CheckResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckResponseModelImpl(
      status: json['status'] as bool,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CheckResponseModelImplToJson(
        _$CheckResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      accountNumber: json['account_number'] as String,
      onlineOffline: json['online_offline'] as String,
      token: json['token'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      balance: (json['balance'] as num).toDouble(),
      comment: json['comment'] as String,
      accountInfo: json['account_info'] as String,
      planId: (json['plan_id'] as num).toInt(),
      referedBy: json['refered_by'],
      confirmationCode: json['confirmation_code'],
      phoneVerifiedAt: json['phone_verified_at'] as String,
      refcode: json['refcode'] as String,
      phoneVerificationCode: json['phone_verification_code'] as String,
      upgradedAt: json['upgraded_at'] as String,
      emailVerifiedAt: json['email_verified_at'],
      inactivateEndAt: json['inactivate_end_at'],
      rememberToken: json['remember_token'],
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'account_number': instance.accountNumber,
      'online_offline': instance.onlineOffline,
      'token': instance.token,
      'name': instance.name,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'image': instance.image,
      'address': instance.address,
      'phone': instance.phone,
      'balance': instance.balance,
      'comment': instance.comment,
      'account_info': instance.accountInfo,
      'plan_id': instance.planId,
      'refered_by': instance.referedBy,
      'confirmation_code': instance.confirmationCode,
      'phone_verified_at': instance.phoneVerifiedAt,
      'refcode': instance.refcode,
      'phone_verification_code': instance.phoneVerificationCode,
      'upgraded_at': instance.upgradedAt,
      'email_verified_at': instance.emailVerifiedAt,
      'inactivate_end_at': instance.inactivateEndAt,
      'remember_token': instance.rememberToken,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
