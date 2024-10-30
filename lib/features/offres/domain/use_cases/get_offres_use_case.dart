import '../../../../core/networking/api_result.dart';
import '../../data/models/offers_response_model.dart';
import '../repo/offres_repo.dart';

class GetOffersUseCase {
  final OffersRepo offersRepo;
  GetOffersUseCase(
    this.offersRepo,
  );
  Future<ApiResult<List<Offer>?>> getOffers() async {
    return await offersRepo.getOffers();
  }
}
