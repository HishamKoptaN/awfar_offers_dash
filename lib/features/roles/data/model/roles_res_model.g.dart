// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RolesResModelImpl _$$RolesResModelImplFromJson(Map<String, dynamic> json) =>
    _$RolesResModelImpl(
      userRoles: (json['user_roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RolesResModelImplToJson(_$RolesResModelImpl instance) =>
    <String, dynamic>{
      'user_roles': instance.userRoles,
      'roles': instance.roles,
    };
