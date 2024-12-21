import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/notification.dart';
part 'notifications_event.freezed.dart';

@freezed
class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.get() = _Get;
  const factory NotificationsEvent.edit({
    required String message,
  }) = _Edit;
  const factory NotificationsEvent.add({
    required Notification notification,
  }) = _Add;
  const factory NotificationsEvent.delete({
    required int id,
  }) = _Delete;
  const factory NotificationsEvent.refersh() = _Refersh;
}
