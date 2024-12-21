import '../../../../../core/networking/api_result.dart';
import '../../data/models/add_offer_group_req_body_model.dart';
import '../../data/models/offer_group.dart';
import '../repo/offer_groups_repo.dart';

class AddOfferGroupUseCase {
  final OfferGroupsRepo offersRepo;
  AddOfferGroupUseCase(
    this.offersRepo,
  );
  Future<ApiResult<OfferGroup>> addOfferGroup({
    required AddOfferGroupReqBodyModel addOfferGroupReqBodyModel,
  }) async {
    return await offersRepo.add(
      addOfferGroupReqBodyModel: addOfferGroupReqBodyModel,
    );
  }
}
