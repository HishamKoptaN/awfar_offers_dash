import '../../../../core/models/offer.dart';

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
