import '../../../../core/networking/api_result.dart';
import '../../data/models/coupon.dart';
import '../repo/coupons_repo.dart';

class UpdateCouponUseCase {
  final CouponsRepo couponsRepo;
  UpdateCouponUseCase(
    this.couponsRepo,
  );
  Future<ApiResult<Coupon>> edit({
    required Coupon coupon,
  }) async {
    return await couponsRepo.edit(
      coupon: coupon,
    );
  }
}
