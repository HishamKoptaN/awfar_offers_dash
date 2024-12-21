import '../../features/offer_groups/data/models/offer_group.dart';

class OfferGroupsSingleton {
  List<OfferGroup> _offersGroups = [];
  static final OfferGroupsSingleton _instance =
      OfferGroupsSingleton._internal();
  OfferGroupsSingleton._internal();
  static OfferGroupsSingleton get instance => _instance;
  List<OfferGroup> get offersGroups => _offersGroups;
  set offersGroups(List<OfferGroup> offersGroupsList) {
    _offersGroups = offersGroupsList;
  }

  Future<void> add({
    required OfferGroup offerGroup,
  }) async {
    _instance.offersGroups.add(
      offerGroup,
    );
  }

  Future<void> replace({
    required OfferGroup offerGroup,
  }) async {
    final index =
        _instance.offersGroups.indexWhere((c) => c.id == offerGroup.id);
    if (index != -1) {
      _instance.offersGroups[index] = offerGroup;
    } else {
      throw Exception('${offerGroup.id} not found');
    }
  }

  void clear() {
    _offersGroups = [];
  }
}
