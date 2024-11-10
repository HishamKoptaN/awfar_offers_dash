import 'package:freezed_annotation/freezed_annotation.dart';
part 'countries_response_model.freezed.dart';
part 'countries_response_model.g.dart';

class CountriesResponseModel {
  static final CountriesResponseModel _instance = CountriesResponseModel._();
  factory CountriesResponseModel() => _instance;
  CountriesResponseModel._();
  List<Country>? countries;
  Future<void> load({
    required List<Country>? countries,
  }) async {
    _instance.countries = countries;
  }

  Future<void> add({
    required Country country,
  }) async {
    _instance.countries!.add(
      country,
    );
  }

  Future<void> replace({
    required Country country,
  }) async {
    final index = _instance.countries!.indexWhere((c) => c.id == country.id);
    if (index != -1) {
      _instance.countries![index] = country;
    } else {
      throw Exception('Country with id ${country.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.countries!.removeWhere(
      (item) => item.id == id,
    );
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
