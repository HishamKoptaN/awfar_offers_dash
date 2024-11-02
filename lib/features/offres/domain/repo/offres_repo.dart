import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/offers_response_model.dart';

abstract class OffersRepo {
  Future<ApiResult<List<Offer>?>> getOffers();

  Future<ApiResult<List<Offer>?>> addOffer({
    required FormData formData,
  });
}
