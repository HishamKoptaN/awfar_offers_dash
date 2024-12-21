import 'package:dio/dio.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/sub_categories_repo.dart';
import '../data_sources/sub_categories_api.dart';
import '../models/sub_categories_response_model.dart';

class SubCategoriesRepoImpl implements SubCategoriesRepo {
  final SubCategoriesApi subCategoriesApi;
  SubCategoriesRepoImpl(
    this.subCategoriesApi,
  );
  @override
  Future<ApiResult<List<SubCategory>>> get() async {
    try {
      final response = await subCategoriesApi.get();
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
  Future<ApiResult<SubCategory>> add({
    required FormData formData,
  }) async {
    try {
      final response = await subCategoriesApi.add(
        formData: formData,
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
  Future<ApiResult<SubCategory>> edit({
    required int id,
    required FormData formData,
  }) async {
    try {
      final response = await subCategoriesApi.edit(
        id: id,
        formData: formData,
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
      await subCategoriesApi.delete(
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
