// To parse this JSON data, do
//
//     final permission = permissionFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'permission.freezed.dart';
part 'permission.g.dart';

List<Permission> permissionFromJson(String str) =>
    List<Permission>.from(json.decode(str).map((x) => Permission.fromJson(x)));

String permissionToJson(List<Permission> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Permission with _$Permission {
  const factory Permission({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "guard_name") String? guardName,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}
