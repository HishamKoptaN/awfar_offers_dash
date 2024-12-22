import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/add_city_req_model.dart';
import '../models/edit_city_request_model.dart';
import '../models/cities_res_model.dart';
part 'cities_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class CitiesApi {
  factory CitiesApi(
    Dio dio, {
    String baseUrl,
  }) = _CitiesApi;
  //! Get Cities
  @GET(
    ApiConstants.cities,
  )
  Future<List<City>> get();
  //! Add Cities
  @POST(ApiConstants.cities)
  Future<City> add({
    @Body() required AddCityReqModel addCityReqModel,
  });
  //! DELETE City
  @DELETE('${ApiConstants.cities}/{id}')
  Future<void> delete({
    @Path('id') required int id,
  });
  //! Edit offer
  @PUT(
    ApiConstants.cities,
  )
  Future<City> edit({
    @Body() required EditCityReqModel editCityReqModel,
  });
}
