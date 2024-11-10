import 'package:awfar_offers_dash/features/governorates/data/models/add_governorate_request_model.dart';
import 'package:awfar_offers_dash/features/governorates/data/models/edit_governorate_request_model.dart';

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
  Future<ApiResult<List<Governorate>>> get() async {
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
  Future<ApiResult<Governorate>> add({
    required AddGovernorateRequestModel addGovernorateRequestModel,
  }) async {
    try {
      final response = await governoratesApi.add(
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
  Future<ApiResult<Governorate>> edit({
    required EditGovernorateRequestModel editGovernorateRequestModel,
  }) async {
    try {
      final response = await governoratesApi.edit(
        editGovernorateRequestModel: editGovernorateRequestModel,
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
