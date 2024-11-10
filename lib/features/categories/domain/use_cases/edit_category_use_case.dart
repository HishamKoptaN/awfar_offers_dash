import '../../../../core/networking/api_result.dart';
import '../../data/models/categories_response_model.dart';
import '../repo/categories_repo.dart';

class EditCategoryUseCase {
  final CategoriesRepo categoriesRepo;
  EditCategoryUseCase(
    this.categoriesRepo,
  );
  Future<ApiResult<void>> edit({
    required Category category,
  }) async {
    return await categoriesRepo.edit(
      category: category,
    );
  }
}
