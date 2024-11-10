import '../../../../core/networking/api_result.dart';
import '../../data/models/add_country_request_body_model.dart';
import '../../data/models/countries_response_model.dart';
import '../../data/models/edit_country_request_body_model.dart';

abstract class CountriesRepo {
  Future<ApiResult<List<Country>?>> get();
  Future<ApiResult<Country>> add({
    required AddCountryRequestBodyModel addCountryRequestBodyModel,
  });

  Future<ApiResult<Country>> edit({
    required EditCountryRequestBodyModel editCountryRequestBodyModel,
  });
  Future<ApiResult<void>> delete({
    required int id,
  });
}
