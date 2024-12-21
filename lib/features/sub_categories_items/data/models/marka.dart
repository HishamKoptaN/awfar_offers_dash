// To parse this JSON data, do
//
//     final subCategoryItem = subCategoryItemFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'marka.freezed.dart';
part 'marka.g.dart';

List<Marka> subCategoryItemFromJson(String str) =>
    List<Marka>.from(json.decode(str).map((x) => Marka.fromJson(x)));

String subCategoryItemToJson(List<Marka> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Marka with _$Marka {
  const factory Marka({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "sub_category_id") int? subCategoryId,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _Marka;

  factory Marka.fromJson(Map<String, dynamic> json) => _$MarkaFromJson(json);
}
