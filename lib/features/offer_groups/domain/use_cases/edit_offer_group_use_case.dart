import '../../../../../core/networking/api_result.dart';
import '../../data/models/offer_group.dart';
import '../repo/offer_groups_repo.dart';

class EditOfferGroupUseCase {
  final OfferGroupsRepo offerGroupsRepo;
  EditOfferGroupUseCase(
    this.offerGroupsRepo,
  );
  Future<ApiResult<OfferGroup>> edit({
    required OfferGroup offerGroup,
  }) async {
    return await offerGroupsRepo.edit(
      offerGroup: offerGroup,
    );
  }
}
