import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/permission.dart';
part 'permissions_event.freezed.dart';

@freezed
class PermissionsEvent with _$PermissionsEvent {
  const factory PermissionsEvent.get() = _Get;
  const factory PermissionsEvent.edit({
    required Permission permission,
  }) = _Edit;
  const factory PermissionsEvent.add({
    required Permission permission,
  }) = _Add;
}
