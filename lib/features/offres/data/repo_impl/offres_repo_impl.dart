import 'package:awfar_offers_dash/features/offres/data/models/add_offer_request_body_model.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/offres_repo.dart';
import '../data_sources/offers_api.dart';
import '../models/offers_response_model.dart';

class OffersRepoImpl implements OffersRepo {
  final OffersApi offersApi;
  OffersRepoImpl(
    this.offersApi,
  );
  @override
  Future<ApiResult<List<Offer>?>> getOffers() async {
    try {
      final response = await offersApi.getOffers();
      return ApiResult.success(
        response!,
      );
    } catch (error) {
      return ApiResult.failure(
        ApiErrorHandler.handle(
          error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<List<Offer>?>> addOffer({
    required AddOfferRequestBodyModel addOfferRequestBodyModel,
  }) async {
    try {
      final response = await offersApi.addOffer(
        addOfferRequestBodyModel: addOfferRequestBodyModel,
      );
      return ApiResult.success(
        response!,
      );
    } catch (error) {
      return ApiResult.failure(
        ApiErrorHandler.handle(
          error,
        ),
      );
    }
  }
}
