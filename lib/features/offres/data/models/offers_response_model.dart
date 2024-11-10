import 'package:freezed_annotation/freezed_annotation.dart';
part 'offers_response_model.freezed.dart';
part 'offers_response_model.g.dart';

class OffersResponseModel {
  static final OffersResponseModel _instance = OffersResponseModel._();
  factory OffersResponseModel() => _instance;
  OffersResponseModel._();
  List<Offer>? offers;
  Future<void> load({
    required List<Offer>? offers,
  }) async {
    _instance.offers = offers;
  }

  Future<void> add({
    required Offer offer,
  }) async {
    _instance.offers!.add(
      offer,
    );
  }

  Future<void> replace({
    required Offer offer,
  }) async {
    final index = _instance.offers!.indexWhere((c) => c.id == offer.id);
    if (index != -1) {
      _instance.offers![index] = offer;
    } else {
      throw Exception('${offer.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.offers!.removeWhere(
      (item) => item.id == id,
    );
  }
}

@freezed
class Offer with _$Offer {
  const factory Offer({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "name") @Default("") String name,
    @JsonKey(name: "status") @Default("") String status,
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
