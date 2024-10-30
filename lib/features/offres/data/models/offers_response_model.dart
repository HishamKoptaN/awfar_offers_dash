import 'package:freezed_annotation/freezed_annotation.dart';

part 'offers_response_model.freezed.dart';
part 'offers_response_model.g.dart';

@freezed
class OffersResponseModel with _$OffersResponseModel {
  const factory OffersResponseModel({
    required List<Offer> offers,
  }) = _OffersResponseModel;

  factory OffersResponseModel.fromJson(List<dynamic> jsonList) {
    return OffersResponseModel(
      offers: jsonList.map((offerJson) => Offer.fromJson(offerJson)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() =>
      offers.map((offer) => offer.toJson()).toList();
}

@freezed
class Offer with _$Offer {
  const factory Offer({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "store_id") required int storeId,
    @JsonKey(name: "category_id") required int categoryId,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "end_at") dynamic endAt,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}
