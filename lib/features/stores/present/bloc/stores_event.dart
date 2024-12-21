import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'stores_event.freezed.dart';

@freezed
class StoresEvent with _$StoresEvent {
  const factory StoresEvent.get() = _Get;
  const factory StoresEvent.add({
    required FormData formData,
  }) = _Add;
  const factory StoresEvent.delete({
    required int id,
  }) = _Delete;
  const factory StoresEvent.edit({
    required int id,
    required FormData formData,
  }) = _Edit;
}
