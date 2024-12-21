import '../../features/stores/data/models/store.dart';

class StoresSingleton {
  List<Store> _stores = [];
  static final StoresSingleton _instance = StoresSingleton._internal();

  StoresSingleton._internal();

  static StoresSingleton get instance => _instance;

  List<Store> get stores => _stores;

  set stores(List<Store> storesList) {
    _stores = storesList;
  }

  Future<void> add({
    required Store store,
  }) async {
    _instance.stores.add(
      store,
    );
  }

  Future<void> replace({
    required Store store,
  }) async {
    final index = _instance.stores.indexWhere((c) => c.id == store.id);
    if (index != -1) {
      _instance.stores[index] = store;
    } else {
      throw Exception('${store.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.stores.removeWhere(
      (item) => item.id == id,
    );
  }

  void clear() {
    _stores = [];
  }
}
