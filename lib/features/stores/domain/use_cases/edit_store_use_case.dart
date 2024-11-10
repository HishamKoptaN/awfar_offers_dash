import '../../../../core/networking/api_result.dart';
import '../../data/models/stores_response_model.dart';
import '../repo/stores_repo.dart';

class EditStoreUseCase {
  final StoresRepo storesRepo;
  EditStoreUseCase(
    this.storesRepo,
  );
  Future<ApiResult<void>> edit({
    required Store store,
  }) async {
    return await storesRepo.edit(
      store: store,
    );
  }
}
