import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_response_model.freezed.dart';
part 'categories_response_model.g.dart';

class CategoriesResponseModel {
  static final CategoriesResponseModel _instance = CategoriesResponseModel._();
  factory CategoriesResponseModel() => _instance;
  CategoriesResponseModel._();
  List<Category>? categories;
  Future<void> load({
    required List<Category>? categories,
  }) async {
    _instance.categories = categories;
  }

  Future<void> add({
    required Category category,
  }) async {
    _instance.categories!.add(
      category,
    );
  }

  Future<void> replace({
    required Category offer,
  }) async {
    final index = _instance.categories!.indexWhere((c) => c.id == offer.id);
    if (index != -1) {
      _instance.categories![index] = offer;
    } else {
      throw Exception('${offer.id} not found');
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

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "id") @Default(0) int? id,
    @JsonKey(name: "name") @Default("") String? name,
    @JsonKey(name: "created_at") @Default("") String? createdAt,
    @JsonKey(name: "updated_at") @Default("") String? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
