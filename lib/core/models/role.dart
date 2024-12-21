// To parse this JSON data, do
//
//     final role = roleFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/permissions/data/model/permission.dart';
part 'role.freezed.dart';
part 'role.g.dart';

@freezed
class Role with _$Role {
  const factory Role({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "guard_name") String? guardName,
    @JsonKey(name: "permissions") List<Permission>? permissions,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}
