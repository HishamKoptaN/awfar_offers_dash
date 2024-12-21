// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExternalNotificationImpl _$$ExternalNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$ExternalNotificationImpl(
      topic: json['topic'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ExternalNotificationImplToJson(
        _$ExternalNotificationImpl instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'title': instance.title,
      'message': instance.message,
    };
