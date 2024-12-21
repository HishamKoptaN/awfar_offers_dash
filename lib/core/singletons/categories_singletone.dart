import '../../features/categories/data/models/category.dart';

class CategoriesSingleton {
  List<Category>? _categories;
  static final CategoriesSingleton _instance = CategoriesSingleton._internal();
  CategoriesSingleton._internal();
  static CategoriesSingleton get instance => _instance;
  List<Category>? get categories => _categories;
  set categories(List<Category>? categories) {
    _categories = categories;
  }

  void clearUser() {
    _categories = null;
  }

  Future<void> add({
    required Category category,
  }) async {
    _instance.categories!.add(
      category,
    );
  }

  Future<void> replace({
    required Category category,
  }) async {
    final index = _instance.categories!.indexWhere((c) => c.id == category.id);
    if (index != -1) {
      _instance.categories![index] = category;
    } else {
      throw Exception('${category.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.categories!.removeWhere(
      (item) => item.id == id,
    );
  }
}
