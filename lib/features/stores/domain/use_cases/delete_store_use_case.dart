import '../../../../core/networking/api_result.dart';
import '../repo/stores_repo.dart';

class DeleteStoreUseCase {
  final StoresRepo storesRepo;
  DeleteStoreUseCase(
    this.storesRepo,
  );
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    return await storesRepo.delete(
      id: id,
    );
  }
}
