import 'package:freezed_annotation/freezed_annotation.dart';
part 'sub_categories_response_model.freezed.dart';
part 'sub_categories_response_model.g.dart';

@freezed
class SubCategory with _$SubCategory {
  const factory SubCategory({
    @JsonKey(name: "id") @Default(0) int? id,
    @JsonKey(name: "name") @Default("") String? name,
    @JsonKey(name: "image") @Default("") String? image,
    @JsonKey(name: "category_id") @Default(0) int? categoryId,
    @JsonKey(name: "created_at") @Default("") String? createdAt,
    @JsonKey(name: "updated_at") @Default("") String? updatedAt,
  }) = _SubCategory;
  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
}
