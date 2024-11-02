import 'package:awfar_offers_dash/features/stores/data/models/add_store_request_body_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/stores_repo.dart';
import '../data_sources/stores_api.dart';
import '../models/stores_response_model.dart';

class StoresRepoImpl implements StoresRepo {
  final StoresApi storesApi;
  StoresRepoImpl(
    this.storesApi,
  );
  @override
  Future<ApiResult<List<Store>?>> getStores() async {
    try {
      final response = await storesApi.getStores();
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
  Future<ApiResult<List<Store>?>> addStore({
    required FormData formData,
  }) async {
    try {
      final response = await storesApi.addStore(
        formData: formData,
      );
      return ApiResult.success(
        data: [],
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
