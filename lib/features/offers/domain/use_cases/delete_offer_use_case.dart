import '../../../../core/networking/api_result.dart';
import '../repo/offres_repo.dart';

class DeleteOfferUseCase {
  final OffersRepo offersRepo;
  DeleteOfferUseCase(
    this.offersRepo,
  );
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    return await offersRepo.delete(
      id: id,
    );
  }
}
