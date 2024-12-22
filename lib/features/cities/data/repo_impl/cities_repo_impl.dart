import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/cities_repo.dart';
import '../data_sources/cities_api.dart';
import '../models/add_city_req_model.dart';
import '../models/cities_res_model.dart';
import '../models/edit_city_request_model.dart';

class CitiesRepoImpl implements CitiesRepo {
  final CitiesApi governoratesApi;
  CitiesRepoImpl(
    this.governoratesApi,
  );
  @override
  Future<ApiResult<List<City>>> get() async {
    try {
      final response = await governoratesApi.get();
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
  Future<ApiResult<City>> add({
    required AddCityReqModel addCityReqModel,
  }) async {
    try {
      final response = await governoratesApi.add(
        addCityReqModel: addCityReqModel,
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
      await governoratesApi.delete(
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

  @override
  Future<ApiResult<City>> edit({
    required EditCityReqModel editCityReqModel,
  }) async {
    try {
      final response = await governoratesApi.edit(
        editCityReqModel: editCityReqModel,
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
}
