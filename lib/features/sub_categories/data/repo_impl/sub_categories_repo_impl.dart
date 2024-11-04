import 'package:dio/dio.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/sub_categories_repo.dart';
import '../data_sources/sub_categories_api.dart';
import '../models/add_sub_category_request_body_model.dart';
import '../models/sub_categories_response_model.dart';

class SubCategoriesRepoImpl implements SubCategoriesRepo {
  final SubCategoriesApi subCategoriesApi;
  SubCategoriesRepoImpl(
    this.subCategoriesApi,
  );
  @override
  Future<ApiResult<List<SubCategory>?>> getSubCategories() async {
    try {
      final response = await subCategoriesApi.getSubCategories();
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
  Future<ApiResult<List<SubCategory>?>> addSubCategory({
    required FormData formData,
  }) async {
    try {
      final response = await subCategoriesApi.addSubSubCategory(
        formData: formData,
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
