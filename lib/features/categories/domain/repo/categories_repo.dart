import '../../../../core/networking/api_result.dart';
import '../../data/models/add_category_request_body_model.dart';
import '../../data/models/categories_response_model.dart';

abstract class CategoriesRepo {
  Future<ApiResult<List<Category>?>> getCategories();
  Future<ApiResult<List<Category>?>> addCategory({
    required AddCategoryRequestBodyModel addCategoryRequestBodyModel,
  });
}
