import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/add_sub_category_request_body_model.dart';
import '../../data/models/sub_categories_response_model.dart';

abstract class SubCategoriesRepo {
  Future<ApiResult<List<SubCategory>?>> getSubCategories();
  Future<ApiResult<List<SubCategory>?>> addSubCategory({
    required FormData formData,
  });
}
