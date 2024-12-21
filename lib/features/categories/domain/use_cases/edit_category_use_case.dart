import '../../../../core/networking/api_result.dart';
import '../../data/models/category.dart';
import '../repo/categories_repo.dart';

class EditCategoryUseCase {
  final CategoriesRepo categoriesRepo;
  EditCategoryUseCase(
    this.categoriesRepo,
  );
  Future<ApiResult<Category>> edit({
    required Category category,
  }) async {
    return await categoriesRepo.edit(
      category: category,
    );
  }
}
