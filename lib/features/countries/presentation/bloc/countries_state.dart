import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/countries_response_model.dart';
part 'countries_state.freezed.dart';

@freezed
class CountriesState with _$CountriesState {
  const factory CountriesState.initial() = _Initial;
  const factory CountriesState.countriesLoaded({
    required List<Country>? countriesResponseModel,
  }) = _CountriesLoaded;
  const factory CountriesState.loading() = _Loading;
  const factory CountriesState.success() = _Success;
  const factory CountriesState.failure({
    required String error,
  }) = _Failure;
}
