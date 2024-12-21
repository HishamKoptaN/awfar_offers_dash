import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/coupons_repo.dart';
import '../data_sources/coupons_api.dart';
import '../models/add_coupon_request_model.dart';
import '../models/coupon.dart';

class CouponsRepoImpl implements CouponsRepo {
  final CouponsApi couponsApi;
  CouponsRepoImpl(
    this.couponsApi,
  );
  @override
  Future<ApiResult<List<Coupon>>> getCoupons() async {
    try {
      final response = await couponsApi.get();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<Coupon>> addCoupon({
    required AddCouponRequestModel addCouponRequestModel,
  }) async {
    try {
      final response = await couponsApi.add(
        addCouponRequestModel: addCouponRequestModel,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<Coupon>> edit({
    required Coupon coupon,
  }) async {
    try {
      final response = await couponsApi.edit(
        coupon: coupon,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<void>> deleteCoupon({
    required int id,
  }) async {
    try {
      await couponsApi.delete(
        id: id,
      );
      return const ApiResult.success(
        data: null,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
