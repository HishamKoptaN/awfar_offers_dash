import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_governorate_request_model.dart';
import '../../data/models/edit_governorate_request_model.dart';
part 'governorates_event.freezed.dart';

@freezed
class GovernoratesEvent with _$GovernoratesEvent {
  const factory GovernoratesEvent.get() = _Get;
  const factory GovernoratesEvent.add({
    required AddGovernorateRequestModel addGovernorateRequestModel,
  }) = _AddGovernorate;
  const factory GovernoratesEvent.edit({
    required EditGovernorateRequestModel editGovernorateRequestModel,
  }) = _Edit;
  const factory GovernoratesEvent.delete({
    required int id,
  }) = _Delete;
}
