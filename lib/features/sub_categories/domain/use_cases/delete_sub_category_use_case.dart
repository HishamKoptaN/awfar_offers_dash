import '../../../../core/networking/api_result.dart';
import '../repo/sub_categories_repo.dart';

class DeleteSubCategoryUseCase {
  final SubCategoriesRepo subCategoriesRepo;
  DeleteSubCategoryUseCase(
    this.subCategoriesRepo,
  );
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    return await subCategoriesRepo.delete(
      id: id,
    );
  }
}
