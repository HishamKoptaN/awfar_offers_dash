import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/role.dart';
part 'roles_event.freezed.dart';

@freezed
class RolesEvent with _$RolesEvent {
  const factory RolesEvent.get() = _Get;
  const factory RolesEvent.edit({
    required Role role,
  }) = _Edit;
  const factory RolesEvent.add({
    required Role role,
  }) = _Add;
}
