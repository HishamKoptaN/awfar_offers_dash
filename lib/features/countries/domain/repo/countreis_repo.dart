import '../../../../core/networking/api_result.dart';
import '../../data/models/add_country_request_body_model.dart';
import '../../data/models/countries_response_model.dart';

abstract class CountriesRepo {
  Future<ApiResult<List<Country>?>> getCountries();
  Future<ApiResult<List<Country>?>> addCountry({
    required AddCountryRequestModel addCountryRequestModel,
  });
  Future<ApiResult<List<Country>?>> deleteCountry({
    required int id,
  });
}
