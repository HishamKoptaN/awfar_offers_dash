import 'package:freezed_annotation/freezed_annotation.dart';
part 'offers_response_model.freezed.dart';
part 'offers_response_model.g.dart';

class OffersResponseModel {
  static final OffersResponseModel _instance = OffersResponseModel._();
  factory OffersResponseModel() => _instance;
  OffersResponseModel._();
  List<Offer>? offers;
  Future<void> loadOffers({
    required List<Offer>? offers,
  }) async {
    _instance.offers = offers;
  }
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
