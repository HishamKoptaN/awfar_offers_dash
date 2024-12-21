import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_marka_req_body_model.dart';
import '../../data/models/marka.dart';
part 'markas_event.freezed.dart';

@freezed
class MarkasEvent with _$MarkasEvent {
  const factory MarkasEvent.get({
    required int id,
  }) = _Get;
  const factory MarkasEvent.add({
    required AddMarkaReqBodyModel addMarkaReqBodyModel,
  }) = _Add;
  const factory MarkasEvent.edit({
    required Marka marka,
  }) = _Edit;
  const factory MarkasEvent.delete({
    required int id,
  }) = _Delete;
}
