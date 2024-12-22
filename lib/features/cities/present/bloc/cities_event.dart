import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_city_req_model.dart';
import '../../data/models/edit_city_request_model.dart';
part 'cities_event.freezed.dart';

@freezed
class CitiesEvent with _$CitiesEvent {
  const factory CitiesEvent.get() = _Get;
  const factory CitiesEvent.add({
    required AddCityReqModel addCityReqModel,
  }) = _AddCity;
  const factory CitiesEvent.edit({
    required EditCityReqModel editCityReqModel,
  }) = _Edit;
  const factory CitiesEvent.delete({
    required int id,
  }) = _Delete;
}
