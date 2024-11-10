import '../../../../core/networking/api_result.dart';
import '../repo/categories_repo.dart';

class DeleteCategoryUseCase {
  final CategoriesRepo categoriesRepo;
  DeleteCategoryUseCase(
    this.categoriesRepo,
  );
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    return await categoriesRepo.delete(
      id: id,
    );
  }
}
