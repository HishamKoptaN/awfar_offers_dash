import 'package:awfar_offers_dash/features/countries/data/models/add_country_request_body_model.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/countreis_repo.dart';
import '../data_sources/countries_api.dart';
import '../models/countries_response_model.dart';

class CountriesRepoImpl implements CountriesRepo {
  final CountriesApi countriesApi;
  CountriesRepoImpl(
    this.countriesApi,
  );
  @override
  Future<ApiResult<List<Country>?>> getCountries() async {
    try {
      final response = await countriesApi.getCountries();
      return ApiResult.success(
        response,
      );
    } catch (error) {
      return ApiResult.failure(
        ApiErrorHandler.handle(
          error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<List<Country>?>> addCountry({
    required AddCountryRequestModel addCountryRequestModel,
  }) async {
    try {
      final response = await countriesApi.addCountry(
        addCountryRequestModel: addCountryRequestModel,
      );
      return ApiResult.success(
        response,
      );
    } catch (error) {
      return ApiResult.failure(
        ApiErrorHandler.handle(
          error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<List<Country>?>> deleteCountry({
    required int id,
  }) async {
    try {
      final response = await countriesApi.deleteCountry(
        id: id,
      );
      return ApiResult.success(
        response,
      );
    } catch (error) {
      return ApiResult.failure(
        ApiErrorHandler.handle(
          error,
        ),
      );
    }
  }
}
