import '../../../../core/networking/api_result.dart';
import '../../data/models/store.dart';
import '../repo/stores_repo.dart';

class GetStoresUseCase {
  final StoresRepo storesRepo;
  GetStoresUseCase(
    this.storesRepo,
  );
  Future<ApiResult<List<Store>>> get() async {
    return await storesRepo.get();
  }
}
