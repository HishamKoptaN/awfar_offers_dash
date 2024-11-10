import '../../../../core/networking/api_result.dart';
import '../../data/models/add_coupon_request_model.dart';
import '../repo/coupons_repo.dart';

class AddCouponUseCase {
  final CouponsRepo couponsRepo;
  AddCouponUseCase(
    this.couponsRepo,
  );
  Future<ApiResult<void>> addCoupon({
    required AddCouponRequestModel addCouponRequestModel,
  }) async {
    return await couponsRepo.addCoupon(
      addCouponRequestModel: addCouponRequestModel,
    );
  }
}
