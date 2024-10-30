import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_country_request_body_model.dart';
part 'countries_event.freezed.dart';

@freezed
class CountriesEvent with _$CountriesEvent {
  const factory CountriesEvent.getCountries() = _GetCountries;
  const factory CountriesEvent.addCountryEvent({
    required AddCountryRequestModel addCountryRequestModel,
  }) = _AddCountryEvent;
  const factory CountriesEvent.updateCountries() = _UpdateCountries;
  const factory CountriesEvent.deleteCountries({
    required int id,
  }) = _DeleteCountries;
}
