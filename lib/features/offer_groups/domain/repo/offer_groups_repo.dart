import '../../../../../core/networking/api_result.dart';
import '../../data/models/add_offer_group_req_body_model.dart';
import '../../data/models/offer_group.dart';

abstract class OfferGroupsRepo {
  Future<ApiResult<List<OfferGroup>?>> get({
    required int storeId,
  });

  Future<ApiResult<OfferGroup>> add({
    required AddOfferGroupReqBodyModel addOfferGroupReqBodyModel,
  });
  Future<ApiResult<void>> delete({
    required int id,
  });
  Future<ApiResult<OfferGroup>> edit({
    required OfferGroup offerGroup,
  });
}
