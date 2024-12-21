import '../../features/governorates/data/models/governorates_response_model.dart';

class GovernoratesSingleton {
  List<Governorate> _governorates = [];
  static final GovernoratesSingleton _instance =
      GovernoratesSingleton._internal();
  GovernoratesSingleton._internal();
  static GovernoratesSingleton get instance => _instance;
  List<Governorate> get governorates => _governorates;
  set governorates(
    List<Governorate> governoratesList,
  ) {
    _governorates = governoratesList;
  }

  Future<void> add({
    required Governorate governorate,
  }) async {
    _instance.governorates.add(
      governorate,
    );
  }

  Future<void> replace({
    required Governorate governorate,
  }) async {
    final index =
        _instance.governorates.indexWhere((c) => c.id == governorate.id);
    if (index != -1) {
      _instance.governorates[index] = governorate;
    } else {
      throw Exception('${governorate.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.governorates.removeWhere(
      (item) => item.id == id,
    );
  }

  void clear() {
    _governorates = [];
  }
}
