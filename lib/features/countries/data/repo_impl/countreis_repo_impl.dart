import 'package:awfar_offers_dash/features/countries/data/models/add_country_request_body_model.dart';
import 'package:awfar_offers_dash/features/countries/data/models/edit_country_request_body_model.dart';

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
  Future<ApiResult<List<Country>?>> get() async {
    try {
      final response = await countriesApi.get();
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
  Future<ApiResult<Country>> add({
    required AddCountryRequestBodyModel addCountryRequestBodyModel,
  }) async {
    try {
      final response = await countriesApi.add(
        addCountryRequestBodyModel: addCountryRequestBodyModel,
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
  Future<ApiResult<Country>> edit({
    required EditCountryRequestBodyModel editCountryRequestBodyModel,
  }) async {
    try {
      final response = await countriesApi.edit(
        editCountryRequestBodyModel: editCountryRequestBodyModel,
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
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    try {
      await countriesApi.delete(
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
