import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer.freezed.dart';
part 'offer.g.dart';

@freezed
class Offer with _$Offer {
  const factory Offer({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "status") @Default(false) bool status,
    @JsonKey(name: "name") @Default("") String name,
    @JsonKey(name: "store_id") @Default(0) int storeId,
    @JsonKey(name: "sub_category_id") @Default(0) int subCategoryId,
    @JsonKey(name: "description") @Default("") String description,
    @JsonKey(name: "image") @Default("") String image,
    @JsonKey(name: "end_at") @Default("") String? endAt,
    @JsonKey(name: "days_remaining") @Default(0) int daysRemaining,
    @JsonKey(name: "created_at") @Default("") String createdAt,
    @JsonKey(name: "updated_at") @Default("") String updatedAt,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}
