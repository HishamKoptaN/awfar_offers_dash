import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/external_notification.dart';
part 'external_notifications_event.freezed.dart';

@freezed
class ExternalNotificationsEvent with _$ExternalNotificationsEvent {
  const factory ExternalNotificationsEvent.add({
    required ExternalNotification externalNotification,
  }) = _Add;
}
