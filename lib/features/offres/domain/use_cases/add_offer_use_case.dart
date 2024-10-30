import '../../../../core/networking/api_result.dart';
import '../../data/models/add_offer_request_body_model.dart';
import '../../data/models/offers_response_model.dart';
import '../repo/offres_repo.dart';

class AddOfferUseCase {
  final OffersRepo offersRepo;
  AddOfferUseCase(
    this.offersRepo,
  );
  Future<ApiResult<List<Offer>?>> addOffer({
    required AddOfferRequestBodyModel addOfferRequestBodyModel,
  }) async {
    return await offersRepo.addOffer(
      addOfferRequestBodyModel: addOfferRequestBodyModel,
    );
  }
}
