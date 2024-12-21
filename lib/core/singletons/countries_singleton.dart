import '../../features/countries/data/models/countries_res_model.dart';

class CountriesSingleton {
  static final CountriesSingleton _instance = CountriesSingleton._internal();
  CountriesSingleton._internal();
  static CountriesSingleton get instance => _instance;
  List<Country> _countries = [];
  List<Country> get countries => _countries;
  set countries(List<Country> countriesList) {
    _countries = countriesList;
  }

  Future<void> add({
    required Country country,
  }) async {
    _instance.countries.add(
      country,
    );
  }

  Future<void> replace({
    required Country country,
  }) async {
    final index = _instance.countries.indexWhere((c) => c.id == country.id);
    if (index != -1) {
      _instance.countries[index] = country;
    } else {
      throw Exception('${country.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.countries.removeWhere(
      (item) => item.id == id,
    );
  }
}
