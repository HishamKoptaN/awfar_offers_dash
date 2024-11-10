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
  Future<ApiResult<List<Store>>> get() async {
    try {
      final response = await storesApi.get();
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
  Future<ApiResult<void>> addStore({
    required FormData formData,
  }) async {
    try {
      await storesApi.add(
        formData: formData,
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
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    try {
      await storesApi.delete(
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
  Future<ApiResult<void>> edit({
    required Store store,
  }) async {
    try {
      await storesApi.edit(
        store: store,
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
  Future<ApiResult<void>> editImage({
    required int id,
    required FormData formData,
  }) async {
    try {
      await storesApi.editImage(
        id: id,
        formData: formData,
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
