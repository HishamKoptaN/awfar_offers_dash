// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpRequestBodyImpl _$$SignUpRequestBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$SignUpRequestBodyImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$SignUpRequestBodyImplToJson(
        _$SignUpRequestBodyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'address': instance.address,
      'phone': instance.phone,
    };
