import '../../../../core/networking/api_result.dart';
import '../../data/models/add_category_req_body_model.dart';
import '../../data/models/category.dart';

abstract class CategoriesRepo {
  Future<ApiResult<List<Category>?>> get();
  Future<ApiResult<Category>> add({
    required AddCategoryReqBodyModel addCategoryReqBodyModel,
  });

  Future<ApiResult<Category>> edit({
    required Category category,
  });
  Future<ApiResult<void>> delete({
    required int id,
  });
}
