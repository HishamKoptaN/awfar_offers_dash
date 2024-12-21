import '../../../../core/networking/api_result.dart';
import '../repo/countreis_repo.dart';

class DeleteCountryUseCase {
  final CountriesRepo countreisRepo;
  DeleteCountryUseCase(
    this.countreisRepo,
  );
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    return await countreisRepo.delete(
      id: id,
    );
  }
}
