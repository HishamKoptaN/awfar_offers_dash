import 'package:awfar_offers_dash/features/countries/data/models/countries_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/add_country_request_body_model.dart';
import '../models/edit_country_request_body_model.dart';
part 'countries_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class CountriesApi {
  factory CountriesApi(
    Dio dio, {
    String baseUrl,
  }) = _CountriesApi;
  //! Get Country
  @GET(ApiConstants.countries)
  Future<List<Country>?> get();
  //! Add country
  @POST(ApiConstants.countries)
  Future<Country> add({
    @Body() required AddCountryRequestBodyModel addCountryRequestBodyModel,
  });
  //! Edit Country

  @PUT('${ApiConstants.countries}/{id}')
  Future<Country> edit({
    @Body() required EditCountryRequestBodyModel editCountryRequestBodyModel,
  });
  //! DELETE Country
  @DELETE('${ApiConstants.countries}/{id}')
  Future<void> delete({
    @Path('id') required int id,
  });
}
