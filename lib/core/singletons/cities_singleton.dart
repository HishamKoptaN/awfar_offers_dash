import '../../features/cities/data/models/cities_res_model.dart';

class CitiesSingleton {
  List<City> _cities = [];
  static final CitiesSingleton _instance = CitiesSingleton._internal();
  CitiesSingleton._internal();
  static CitiesSingleton get instance => _instance;
  List<City> get cities => _cities;
  set cities(
    List<City> citiesList,
  ) {
    _cities = citiesList;
  }

  Future<void> add({
    required City governorate,
  }) async {
    _instance.cities.add(
      governorate,
    );
  }

  Future<void> replace({
    required City governorate,
  }) async {
    final index = _instance.cities.indexWhere((c) => c.id == governorate.id);
    if (index != -1) {
      _instance.cities[index] = governorate;
    } else {
      throw Exception('${governorate.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.cities.removeWhere(
      (item) => item.id == id,
    );
  }

  void clear() {
    _cities = [];
  }
}
