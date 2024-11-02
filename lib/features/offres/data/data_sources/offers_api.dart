import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/offers_response_model.dart';
part 'offers_api.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class OffersApi {
  factory OffersApi(Dio dio, {String? baseUrl}) = _OffersApi;

  //! GET Offers
  @GET(ApiConstants.offers)
  Future<List<Offer>?> getOffers();

  //! Add Offer
  @POST(
    ApiConstants.offers,
  )
  Future<List<Offer>?> addOffer({
    @Body() required FormData formData,
  });
}
