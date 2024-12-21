import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/add_coupon_request_model.dart';
import '../models/coupon.dart';
part 'coupons_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class CouponsApi {
  factory CouponsApi(
    Dio dio, {
    String baseUrl,
  }) = _CouponsApi;
  //! Get coupons
  @GET(
    ApiConstants.coupons,
  )
  Future<List<Coupon>> get();
  //! Add coupon
  @POST(
    ApiConstants.coupons,
  )
  Future<Coupon> add({
    @Body() required AddCouponRequestModel addCouponRequestModel,
  });

  //! Update coupon
  @PUT(
    ApiConstants.coupons,
  )
  Future<Coupon> edit({
    @Body() required Coupon coupon,
  });
  //! DELETE coupon
  @DELETE(
    '${ApiConstants.coupons}/{id}',
  )
  Future<void> delete({
    @Path('id') required int id,
  });
}
