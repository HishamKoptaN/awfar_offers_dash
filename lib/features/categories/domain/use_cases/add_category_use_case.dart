import '../../../../core/networking/api_result.dart';
import '../../data/models/add_category_req_body_model.dart';
import '../../data/models/category.dart';
import '../repo/categories_repo.dart';

class AddCategoryUseCase {
  final CategoriesRepo categoriesRepo;
  AddCategoryUseCase(
    this.categoriesRepo,
  );
  Future<ApiResult<Category>> add({
    required AddCategoryReqBodyModel addCategoryReqBodyModel,
  }) async {
    return await categoriesRepo.add(
      addCategoryReqBodyModel: addCategoryReqBodyModel,
    );
  }
}
