import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../repo/stores_repo.dart';

class AddStoreUseCase {
  final StoresRepo storesRepo;
  AddStoreUseCase(
    this.storesRepo,
  );

  Future<ApiResult<void>> add({
    required FormData formData,
  }) async {
    final result = await storesRepo.addStore(
      formData: formData,
    );
    return result.when(
      success: (newStore) {
        return const ApiResult.success(
          data: null,
        );
      },
      failure: (error) {
        return ApiResult.failure(
          apiErrorModel: error,
        );
      },
    );
  }
}
