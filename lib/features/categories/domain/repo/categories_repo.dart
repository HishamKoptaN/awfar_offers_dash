import '../../../../core/networking/api_result.dart';
import '../../data/models/add_category_request_body_model.dart';
import '../../data/models/categories_response_model.dart';

abstract class CategoriesRepo {
  Future<ApiResult<List<Category>?>> get();
  Future<ApiResult<Category>> add({
    required AddCategoryRequestBodyModel addCategoryRequestBodyModel,
  });

  Future<ApiResult<void>> edit({
    required Category category,
  });
  Future<ApiResult<void>> delete({
    required int id,
  });
}
