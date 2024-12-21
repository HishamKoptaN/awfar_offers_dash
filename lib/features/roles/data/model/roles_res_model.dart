// To parse this JSON data, do
//
//     final rolesResModel = rolesResModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import '../../../../core/models/role.dart';
part 'roles_res_model.freezed.dart';
part 'roles_res_model.g.dart';

RolesResModel rolesResModelFromJson(String str) =>
    RolesResModel.fromJson(json.decode(str));

String rolesResModelToJson(RolesResModel data) => json.encode(data.toJson());

@freezed
class RolesResModel with _$RolesResModel {
  const factory RolesResModel({
    @JsonKey(name: "user_roles") List<Role>? userRoles,
    @JsonKey(name: "roles") List<Role>? roles,
  }) = _RolesResModel;

  factory RolesResModel.fromJson(Map<String, dynamic> json) =>
      _$RolesResModelFromJson(json);
}
