import '../../../../core/networking/api_result.dart';
import '../../data/models/coupon.dart';
import '../repo/coupons_repo.dart';

class GetCouponsUseCase {
  final CouponsRepo couponsRepo;
  GetCouponsUseCase(
    this.couponsRepo,
  );
  Future<ApiResult<List<Coupon>>> getCoupons() async {
    return await couponsRepo.getCoupons();
  }
}
