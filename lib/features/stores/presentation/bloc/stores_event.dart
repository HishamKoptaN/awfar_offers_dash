import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_store_request_body_model.dart';
part 'stores_event.freezed.dart';

@freezed
class StoresEvent with _$StoresEvent {
  const factory StoresEvent.getEvent() = _GetEvent;
  const factory StoresEvent.addEvent({
    required FormData formData,
  }) = _AddEvent;
  const factory StoresEvent.deleteEvent() = _DeleteEvent;
  const factory StoresEvent.updateEvent() = _UpdateEvent;
}
