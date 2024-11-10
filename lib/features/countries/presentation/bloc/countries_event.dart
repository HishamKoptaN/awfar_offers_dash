import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_country_request_body_model.dart';
import '../../data/models/edit_country_request_body_model.dart';
part 'countries_event.freezed.dart';

@freezed
class CountriesEvent with _$CountriesEvent {
  const factory CountriesEvent.get() = _Get;
  const factory CountriesEvent.add({
    required AddCountryRequestBodyModel addCountryRequestBodyModel,
  }) = _Add;
  const factory CountriesEvent.edit({
    required EditCountryRequestBodyModel editCountryRequestBodyModel,
  }) = _Edit;
  const factory CountriesEvent.delete({
    required int id,
  }) = _Delete;
}
