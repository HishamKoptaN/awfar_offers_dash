import '../../../../core/networking/api_result.dart';
import '../repo/coupons_repo.dart';

class DeleteCouponUseCase {
  final CouponsRepo couponsRepo;
  DeleteCouponUseCase(
    this.couponsRepo,
  );
  Future<ApiResult<void>> deleteCoupon({
    required int id,
  }) async {
    return await couponsRepo.deleteCoupon(
      id: id,
    );
  }
}
