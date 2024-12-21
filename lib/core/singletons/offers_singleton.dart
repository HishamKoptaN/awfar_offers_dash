import '../models/offer.dart';

class OffersSingleton {
  List<Offer> _offers = [];
  static final OffersSingleton _instance = OffersSingleton._internal();
  OffersSingleton._internal();

  static OffersSingleton get instance => _instance;

  List<Offer> get offers => _offers;

  set offers(List<Offer> offersList) {
    _offers = offersList;
  }

  Future<void> add({
    required Offer offer,
  }) async {
    _instance.offers.add(
      offer,
    );
  }

  Future<void> replace({
    required Offer offer,
  }) async {
    final index = _instance.offers.indexWhere((c) => c.id == offer.id);
    if (index != -1) {
      _instance.offers[index] = offer;
    } else {
      throw Exception('${offer.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.offers.removeWhere(
      (item) => item.id == id,
    );
  }

  void clear() {
    _offers = [];
  }
}
