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
  Future<Offer> addOffer({
    @Body() required FormData formData,
  });

  //! Edit offer
  @PUT(
    ApiConstants.offers,
  )
  Future<Offer> edit({
    @Body() required Offer offer,
  });
  //! Edit Image
  @PUT(
    '${ApiConstants.offers}/{id}',
  )
  Future editImage({
    required int id,
    @Body() required FormData formData,
  }); //! DELETE offer
  @DELETE(
    '${ApiConstants.offers}/{id}',
  )
  Future<void> delete({
    @Path('id') required int id,
  });
}
