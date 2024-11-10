import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_coupon_request_model.dart';
import '../../data/models/coupons_response_model.dart';
part 'coupons_event.freezed.dart';

@freezed
class CouponsEvent with _$CouponsEvent {
  const factory CouponsEvent.get() = _GetCoupons;
  const factory CouponsEvent.add({
    required AddCouponRequestModel addCouponRequestModel,
  }) = _AddCoupon;
  const factory CouponsEvent.edit({
    required Coupon coupon,
  }) = _EditCoupon;
  const factory CouponsEvent.delete({
    required int id,
  }) = _DeleteCoupon;
}
