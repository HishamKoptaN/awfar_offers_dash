import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';
part 'category.g.dart';

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
