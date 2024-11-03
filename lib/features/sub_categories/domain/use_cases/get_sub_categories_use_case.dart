import '../../../../core/networking/api_result.dart';
import '../../data/models/sub_categories_response_model.dart';
import '../repo/sub_categories_repo.dart';

class GetSubCategoriesUseCase {
  final SubCategoriesRepo subCategoriesRepo;
  GetSubCategoriesUseCase(
    this.subCategoriesRepo,
  );
  Future<ApiResult<List<SubCategory>?>> getSubCategories() async {
    return await subCategoriesRepo.getSubCategories();
  }
}
