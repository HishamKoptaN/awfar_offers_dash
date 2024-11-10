import '../../../../core/networking/api_result.dart';
import '../../data/models/offers_response_model.dart';
import '../repo/offres_repo.dart';

class EditOfferUseCase {
  final OffersRepo offersRepo;
  EditOfferUseCase(
    this.offersRepo,
  );
  Future<ApiResult<void>> edit({
    required Offer offer,
  }) async {
    return await offersRepo.edit(
      offer: offer,
    );
  }
}
