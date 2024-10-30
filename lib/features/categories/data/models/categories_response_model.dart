import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_response_model.freezed.dart';
part 'categories_response_model.g.dart';

class CategoriesResponseModel {
  static final CategoriesResponseModel _instance = CategoriesResponseModel._();
  factory CategoriesResponseModel() => _instance;
  CategoriesResponseModel._();
  List<Category>? categories;
  Future<void> loadCategories(
    List<Category>? categories,
  ) async {
    _instance.categories = categories;
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
