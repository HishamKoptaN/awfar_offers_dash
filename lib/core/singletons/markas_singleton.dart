import '../../features/sub_categories_items/data/models/marka.dart';

class MarkasSingleton {
  List<Marka> _markas = [];
  static final MarkasSingleton _instance = MarkasSingleton._internal();

  MarkasSingleton._internal();

  static MarkasSingleton get instance => _instance;

  List<Marka> get markas => _markas;

  set markas(
    List<Marka> markasList,
  ) {
    _markas = markasList;
  }

  Future<void> add({
    required Marka marka,
  }) async {
    _instance.markas.add(
      marka,
    );
  }

  Future<void> replace({
    required Marka marka,
  }) async {
    final index = _instance.markas.indexWhere((c) => c.id == marka.id);
    if (index != -1) {
      _instance.markas[index] = marka;
    } else {
      throw Exception('${marka.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.markas.removeWhere(
      (item) => item.id == id,
    );
  }

  void clear() {
    _markas = [];
  }
}
