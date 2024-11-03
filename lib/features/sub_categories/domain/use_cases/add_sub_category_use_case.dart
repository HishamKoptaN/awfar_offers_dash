import '../../../../core/networking/api_result.dart';
import '../../data/models/add_sub_category_request_body_model.dart';
import '../../data/models/sub_categories_response_model.dart';
import '../repo/sub_categories_repo.dart';

class AddSubCategoryUseCase {
  final SubCategoriesRepo categoriesRepo;
  AddSubCategoryUseCase(
    this.categoriesRepo,
  );
  Future<ApiResult<List<SubCategory>?>> addSubCategory({
    required AddSubCategoryRequestBodyModel addCategoryRequestBodyModel,
  }) async {
    return await categoriesRepo.addSubCategory(
      addSubCategoryRequestBodyModel: addCategoryRequestBodyModel,
    );
  }
}
