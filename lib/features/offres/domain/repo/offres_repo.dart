import '../../../../core/networking/api_result.dart';
import '../../data/models/add_offer_request_body_model.dart';
import '../../data/models/offers_response_model.dart';

abstract class OffersRepo {
  Future<ApiResult<List<Offer>?>> getOffers();

  Future<ApiResult<List<Offer>?>> addOffer({
    required AddOfferRequestBodyModel addOfferRequestBodyModel,
  });
}
