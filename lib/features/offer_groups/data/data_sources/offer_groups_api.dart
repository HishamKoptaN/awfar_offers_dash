import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../data/models/offer_group.dart';
import '../models/add_offer_group_req_body_model.dart';
part 'offer_groups_api.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class OfferGroupsApi {
  factory OfferGroupsApi(
    Dio dio, {
    String? baseUrl,
  }) = _OfferGroupsApi;

  //! GET OfferGroups
  @GET(
    '${ApiConstants.offerGroups}/{storeId}',
  )
  Future<List<OfferGroup>?> get({
    @Path('storeId') required int storeId,
  });

  //! Add Offer
  @POST(
    ApiConstants.offerGroups,
  )
  Future<OfferGroup> add({
    @Body() required AddOfferGroupReqBodyModel addOfferGroupReqBodyModel,
  });

  //! Edit offer
  @PATCH(
    ApiConstants.offerGroups,
  )
  Future<OfferGroup> edit({
    @Body() required OfferGroup offerGroup,
  });
  //! Edit Image
  @PUT(
    '${ApiConstants.offerGroups}/{id}',
  )
  Future editImage({
    required int id,
    @Body() required FormData formData,
  }); //! DELETE offer
  @DELETE(
    '${ApiConstants.offerGroups}/{id}',
  )
  Future<void> delete({
    @Path('id') required int id,
  });
}
