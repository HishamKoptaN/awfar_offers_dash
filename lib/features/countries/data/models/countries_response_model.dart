import 'package:freezed_annotation/freezed_annotation.dart';
part 'countries_response_model.freezed.dart';
part 'countries_response_model.g.dart';

class CountriesResponseModel {
  static final CountriesResponseModel _instance = CountriesResponseModel._();
  factory CountriesResponseModel() => _instance;
  CountriesResponseModel._();
  List<Country>? countries;
  Future<void> loadCountries(List<Country>? countries) async {
    _instance.countries = countries;
  }
}

@freezed
class Country with _$Country {
  const factory Country({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
