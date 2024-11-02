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
  Future<ApiResult<List<Category>?>> getCategories() async {
    try {
      final response = await categoriesApi.getCategories();
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
  Future<ApiResult<List<Category>?>> addCategory({
    required AddCategoryRequestBodyModel addCategoryRequestBodyModel,
  }) async {
    try {
      final response = await categoriesApi.addCategory(
        addCategoryRequestBodyModel: addCategoryRequestBodyModel,
      );
      return ApiResult.success(
        data: response!,
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
