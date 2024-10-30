import 'package:awfar_offers_dash/features/countries/data/models/countries_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/add_country_request_body_model.dart';
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
  Future<List<Country>?> getCountries();
  //! Add country
  @POST(ApiConstants.countries)
  Future<List<Country>?> addCountry({
    @Body() required AddCountryRequestModel addCountryRequestModel,
  });
  //! DELETE Country
  @DELETE('${ApiConstants.countries}/{id}')
  Future<List<Country>?> deleteCountry({
    @Path('id') required int id,
  });

  // @PUT('${ApiConstants.countries}/{id}')
  // Future<void> updateCountry(
  //   @Path("id") int id,
  //   @Body() UpdateCountryRequestModel country,
  // );
}
