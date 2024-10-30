import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_governorate_request_model.dart';
part 'governorates_event.freezed.dart';

@freezed
class GovernoratesEvent with _$GovernoratesEvent {
  const factory GovernoratesEvent.getGovernorate() = _GetGovernorates;
  const factory GovernoratesEvent.addGovernorate({
    required AddGovernorateRequestModel addGovernorateRequestModel,
  }) = _AddGovernorate;
  const factory GovernoratesEvent.updateGovernorates() = _UpdateGovernorate;
  const factory GovernoratesEvent.deleteGovernorates({
    required int id,
  }) = _DeleteGovernorate;
}
