import '../../../../core/networking/api_result.dart';
import '../../../../core/models/offer.dart';
import '../repo/offres_repo.dart';

class GetOffersUseCase {
  final OffersRepo offersRepo;
  GetOffersUseCase(
    this.offersRepo,
  );
  Future<ApiResult<List<Offer>?>> getOffers() async {
    return await offersRepo.get();
  }
}
