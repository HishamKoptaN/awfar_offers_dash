import '../../features/sub_categories/data/models/sub_categories_response_model.dart';

class SubCategoriesSingleton {
  List<SubCategory>? _categories;
  static final SubCategoriesSingleton _instance =
      SubCategoriesSingleton._internal();
  SubCategoriesSingleton._internal();
  static SubCategoriesSingleton get instance => _instance;
  List<SubCategory>? get subCategories => _categories;
  set subCategories(List<SubCategory>? categories) {
    _categories = categories;
  }

  void clearUser() {
    _categories = null;
  }

  Future<void> add({
    required SubCategory subCategory,
  }) async {
    _instance.subCategories!.add(
      subCategory,
    );
  }

  Future<void> replace({
    required SubCategory subCategory,
  }) async {
    final index =
        _instance.subCategories!.indexWhere((c) => c.id == subCategory.id);
    if (index != -1) {
      _instance.subCategories![index] = subCategory;
    } else {
      throw Exception('${subCategory.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.subCategories!.removeWhere(
      (item) => item.id == id,
    );
  }
}
