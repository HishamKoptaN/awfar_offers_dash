import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/categories_repo.dart';
import '../data_sources/categories_api.dart';
import '../models/add_category_request_body_model.dart';
import '../models/categories_response_model.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesApi categoriesApi;
  CategoriesRepoImpl(
    this.categoriesApi,
  );
  @override
  Future<ApiResult<List<Category>?>> get() async {
    try {
      final response = await categoriesApi.get();
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
  Future<ApiResult<Category>> add({
    required AddCategoryRequestBodyModel addCategoryRequestBodyModel,
  }) async {
    try {
      final response = await categoriesApi.addCategory(
        addCategoryRequestBodyModel: addCategoryRequestBodyModel,
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
      await categoriesApi.delete(
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
    required Category category,
  }) async {
    try {
      await categoriesApi.edit(
        category: category,
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
