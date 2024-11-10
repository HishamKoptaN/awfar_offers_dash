import '../../../../core/networking/api_result.dart';
import '../../data/models/sub_categories_response_model.dart';
import '../repo/sub_categories_repo.dart';

class EditSubCategoryUseCase {
  final SubCategoriesRepo subCategoriesRepo;
  EditSubCategoryUseCase(
    this.subCategoriesRepo,
  );
  Future<ApiResult<void>> edit({
    required SubCategory subCategory,
  }) async {
    return await subCategoriesRepo.edit(
      subCategory: subCategory,
    );
  }
}
