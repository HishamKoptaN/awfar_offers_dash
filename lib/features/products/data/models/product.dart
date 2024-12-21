// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'product.freezed.dart';
part 'product.g.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "discount_rate") String? discountRate,
    @JsonKey(name: "offer_id") int? offerId,
    @JsonKey(name: "sub_category_item_id") int? subCategoryItemId,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "amount_saved") String? amountSaved,
    @JsonKey(name: "price_after_discount") String? priceAfterDiscount,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
