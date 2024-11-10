import 'package:awfar_offers_dash/features/coupons/data/models/update_coupon_request_model.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/coupons_repo.dart';
import '../data_sources/coupons_api.dart';
import '../models/add_coupon_request_model.dart';
import '../models/coupons_response_model.dart';

class CouponsRepoImpl implements CouponsRepo {
  final CouponsApi couponsApi;
  CouponsRepoImpl(
    this.couponsApi,
  );
  @override
  Future<ApiResult<List<Coupon>>> getCoupons() async {
    try {
      final response = await couponsApi.getCoupons();
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
      final response = await couponsApi.addCoupon(
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
      final response = await couponsApi.editCoupon(
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
      await couponsApi.deleteCoupon(
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
