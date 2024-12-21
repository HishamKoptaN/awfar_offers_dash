import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/store.dart';
import '../repo/stores_repo.dart';

class AddStoreUseCase {
  final StoresRepo storesRepo;
  AddStoreUseCase(
    this.storesRepo,
  );

  Future<ApiResult<Store>> add({
    required FormData formData,
  }) async {
    final result = await storesRepo.add(
      formData: formData,
    );
    return result.when(
      success: (store) {
        return ApiResult.success(
          data: store,
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
