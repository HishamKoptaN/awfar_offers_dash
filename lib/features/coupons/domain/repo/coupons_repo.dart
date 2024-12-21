import '../../../../core/networking/api_result.dart';
import '../../data/models/add_coupon_request_model.dart';
import '../../data/models/coupon.dart';

abstract class CouponsRepo {
  Future<ApiResult<List<Coupon>>> getCoupons();
  Future<ApiResult<Coupon>> addCoupon({
    required AddCouponRequestModel addCouponRequestModel,
  });
  Future<ApiResult<void>> deleteCoupon({
    required int id,
  });
  Future<ApiResult<Coupon>> edit({
    required Coupon coupon,
  });
}
