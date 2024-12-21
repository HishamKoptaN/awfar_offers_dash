import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/store.dart';
part 'stores_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class StoresApi {
  factory StoresApi(
    Dio dio, {
    String baseUrl,
  }) = _StoresApi;
  //! GET Coupons
  @GET(
    ApiConstants.stores,
  )
  Future<List<Store>> get();
  //! Add store
  @POST(
    ApiConstants.stores,
  )
  Future<Store> add({
    @Body() required FormData formData,
  });
  //! Edit store

  @POST(
    "${ApiConstants.stores}/{id}",
  )
  Future<Store> edit({
    @Path("id") required int id,
    @Body() required FormData formData,
  });
  //! DELETE store
  @DELETE(
    '${ApiConstants.stores}/{id}',
  )
  Future delete({
    @Path('id') required int id,
  });
}
