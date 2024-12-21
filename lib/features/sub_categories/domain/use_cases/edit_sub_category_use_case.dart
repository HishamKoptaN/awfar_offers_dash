import 'package:awfar_offers_dash/features/sub_categories/data/models/sub_categories_response_model.dart';
import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../repo/sub_categories_repo.dart';

class EditSubCategoryUseCase {
  final SubCategoriesRepo subCategoriesRepo;
  EditSubCategoryUseCase(
    this.subCategoriesRepo,
  );
  Future<ApiResult<SubCategory>> edit({
    required int id,
    required FormData formData,
  }) async {
    return await subCategoriesRepo.edit(
      formData: formData,
      id: id,
    );
  }
}
