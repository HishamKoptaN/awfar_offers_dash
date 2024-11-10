import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/sub_categories_response_model.dart';
import '../repo/sub_categories_repo.dart';

class AddSubCategoryUseCase {
  final SubCategoriesRepo categoriesRepo;
  AddSubCategoryUseCase(
    this.categoriesRepo,
  );
  Future<ApiResult<SubCategory>> add({
    required FormData formData,
  }) async {
    return await categoriesRepo.add(
      formData: formData,
    );
  }
}
