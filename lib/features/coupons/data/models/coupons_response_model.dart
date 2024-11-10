import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../stores/data/models/stores_response_model.dart';
part 'coupons_response_model.freezed.dart';
part 'coupons_response_model.g.dart';

class CouponsResponseModel {
  static final CouponsResponseModel _instance = CouponsResponseModel._();
  factory CouponsResponseModel() => _instance;
  CouponsResponseModel._();
  List<Coupon>? coupons;
  Future<void> load({
    required List<Coupon>? coupons,
  }) async {
    _instance.coupons = coupons;
  }

  Future<void> add({
    required Coupon store,
  }) async {
    _instance.coupons!.add(
      store,
    );
  }

  Future<void> replace({
    required Coupon coupon,
  }) async {
    final index = _instance.coupons!.indexWhere((c) => c.id == coupon.id);
    if (index != -1) {
      _instance.coupons![index] = coupon;
    } else {
      throw Exception('${coupon.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.coupons!.removeWhere(
      (item) => item.id == id,
    );
  }
}

@freezed
class Coupon with _$Coupon {
  const factory Coupon({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "store") Store? store,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "is_work") int? isWork,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _Coupon;

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}

List<Coupon> couponFromJson(String str) =>
    List<Coupon>.from(json.decode(str).map((x) => Coupon.fromJson(x)));
