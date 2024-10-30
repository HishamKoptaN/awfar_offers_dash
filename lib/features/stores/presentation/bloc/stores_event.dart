import 'package:freezed_annotation/freezed_annotation.dart';
part 'stores_event.freezed.dart';

@freezed
class StoresEvent with _$StoresEvent {
  const factory StoresEvent.getEvent() = _GetEvent;
  const factory StoresEvent.addEvent() = _AddEvent;
  const factory StoresEvent.deleteEvent() = _DeleteEvent;
  const factory StoresEvent.updateEvent() = _UpdateEvent;
}
