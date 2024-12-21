import '../../features/coupons/data/models/coupon.dart';

class CouponsSingleton {
  static final CouponsSingleton _instance = CouponsSingleton._internal();
  CouponsSingleton._internal();
  static CouponsSingleton get instance => _instance;
  List<Coupon> _coupons = [];
  List<Coupon> get coupons => _coupons;
  set coupons(List<Coupon> couponsList) {
    _coupons = couponsList;
  }

  Future<void> add({
    required Coupon store,
  }) async {
    _instance.coupons.add(
      store,
    );
  }

  Future<void> replace({
    required Coupon coupon,
  }) async {
    final index = _instance.coupons.indexWhere((c) => c.id == coupon.id);
    if (index != -1) {
      _instance.coupons[index] = coupon;
    } else {
      throw Exception('${coupon.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.coupons.removeWhere(
      (item) => item.id == id,
    );
  }
}
