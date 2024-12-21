import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/models/user.dart';
import '../../data/model/notify_req_body.dart';
part 'users_event.freezed.dart';

@freezed
class UsersEvent with _$UsersEvent {
  const factory UsersEvent.get() = _Get;
  const factory UsersEvent.edit({
    required User user,
  }) = _Edit;
  const factory UsersEvent.notify({
    required NotifyReq notifyReq,
  }) = _Notify;
  const factory UsersEvent.add({
    required User user,
  }) = _Add;
}
