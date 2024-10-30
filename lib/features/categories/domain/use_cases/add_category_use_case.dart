import '../../../../core/networking/api_result.dart';
import '../../data/models/add_category_request_body_model.dart';
import '../../data/models/categories_response_model.dart';
import '../repo/categories_repo.dart';

class AddCategoryUseCase {
  final CategoriesRepo categoriesRepo;
  AddCategoryUseCase(
    this.categoriesRepo,
  );
  Future<ApiResult<List<Category>?>> addCategory({
    required AddCategoryRequestBodyModel addCategoryRequestBodyModel,
  }) async {
    return await categoriesRepo.addCategory(
      addCategoryRequestBodyModel: addCategoryRequestBodyModel,
    );
  }
}
