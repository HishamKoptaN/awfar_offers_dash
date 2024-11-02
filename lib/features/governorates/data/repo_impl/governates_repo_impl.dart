import 'package:awfar_offers_dash/features/governorates/data/models/add_governorate_request_model.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/governorates_repo.dart';
import '../data_sources/governorates_api.dart';
import '../models/governorates_response_model.dart';

class GovernoratesRepoImpl implements GovernoratesRepo {
  final GovernoratesApi governoratesApi;
  GovernoratesRepoImpl(
    this.governoratesApi,
  );
  @override
  Future<ApiResult<List<Governorate>?>> getGovernorates() async {
    try {
      final response = await governoratesApi.getGovernorates();
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
  Future<ApiResult<List<Governorate>?>> addGovernorate({
    required AddGovernorateRequestModel addGovernorateRequestModel,
  }) async {
    try {
      final response = await governoratesApi.addGovernorate(
        addGovernorateRequestModel: addGovernorateRequestModel,
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
  Future<ApiResult<List<Governorate>?>> deleteGovernorate({
    required int id,
  }) async {
    try {
      final response = await governoratesApi.deleteGovernorate(
        id: id,
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
