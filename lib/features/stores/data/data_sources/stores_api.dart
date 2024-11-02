import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/add_store_request_body_model.dart';
import '../models/stores_response_model.dart';
part 'stores_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class StoresApi {
  factory StoresApi(
    Dio dio, {
    String baseUrl,
  }) = _StoresApi;
  @GET(
    ApiConstants.stores,
  )
  //! Get Stores
  Future<List<Store>?> getStores();
  //! Add Governorates
  @POST(
    ApiConstants.stores,
  )
  @POST('/stores')
  Future<List<Store>?> addStore({
    @Body() required FormData formData,
  });
}
