import '../../../../../core/networking/api_result.dart';
import '../../data/models/offer_group.dart';
import '../repo/offer_groups_repo.dart';

class GetOfferGroupsUseCase {
  final OfferGroupsRepo offerGroupsRepo;
  GetOfferGroupsUseCase(
    this.offerGroupsRepo,
  );
  Future<ApiResult<List<OfferGroup>?>> get({
    required int storeId,
  }) async {
    return await offerGroupsRepo.get(
      storeId: storeId,
    );
  }
}
