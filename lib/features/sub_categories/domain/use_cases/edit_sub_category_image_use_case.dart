import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/sub_categories_response_model.dart';
import '../repo/sub_categories_repo.dart';

class EditSubCategoryImageUseCase {
  final SubCategoriesRepo subCategoryRepo;
  EditSubCategoryImageUseCase(
    this.subCategoryRepo,
  );
  Future<ApiResult<SubCategory>> edit({
    required int id,
    required FormData formData,
  }) async {
    return await subCategoryRepo.editImage(
      id: id,
      formData: formData,
    );
  }
}
