import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../repo/stores_repo.dart';

class EditStoreImageUseCase {
  final StoresRepo storesRepo;
  EditStoreImageUseCase(
    this.storesRepo,
  );
  Future<ApiResult<void>> edit({
    required int id,
    required FormData formData,
  }) async {
    return await storesRepo.editImage(
      id: id,
      formData: formData,
    );
  }
}
