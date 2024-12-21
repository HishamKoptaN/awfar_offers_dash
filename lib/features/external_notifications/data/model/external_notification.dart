import 'package:freezed_annotation/freezed_annotation.dart';
part 'external_notification.freezed.dart';
part 'external_notification.g.dart';

@freezed
class ExternalNotification with _$ExternalNotification {
  const factory ExternalNotification({
    @JsonKey(name: "topic") String? topic,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "message") String? message,
  }) = _ExternalNotification;

  factory ExternalNotification.fromJson(Map<String, dynamic> json) =>
      _$ExternalNotificationFromJson(json);
}
