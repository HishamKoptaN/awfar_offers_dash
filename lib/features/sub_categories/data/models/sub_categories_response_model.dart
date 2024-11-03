import 'package:freezed_annotation/freezed_annotation.dart';
part 'sub_categories_response_model.freezed.dart';
part 'sub_categories_response_model.g.dart';

class SubCategoriesResponseModel {
  static final SubCategoriesResponseModel _instance =
      SubCategoriesResponseModel._();
  factory SubCategoriesResponseModel() => _instance;
  SubCategoriesResponseModel._();
  List<SubCategory>? subCategories;
  Future<void> loadCategories({
    required List<SubCategory>? subCategories,
  }) async {
    _instance.subCategories = subCategories;
  }
}

@freezed
class SubCategory with _$SubCategory {
  const factory SubCategory({
    @JsonKey(name: "id") @Default(0) int? id,
    @JsonKey(name: "name") @Default("") String? name,
    @JsonKey(name: "image") @Default("") String? image,
    @JsonKey(name: "category_id") @Default(0) int? categoryId,
    @JsonKey(name: "created_at") @Default("") String? createdAt,
    @JsonKey(name: "updated_at") @Default("") String? updatedAt,
  }) = _Category;
  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
}
