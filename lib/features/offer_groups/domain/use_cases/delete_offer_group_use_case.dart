import '../../../../../core/networking/api_result.dart';
import '../repo/offer_groups_repo.dart';

class DeleteOfferGroupUseCase {
  final OfferGroupsRepo offerGroupsRepo;
  DeleteOfferGroupUseCase(
    this.offerGroupsRepo,
  );
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    return await offerGroupsRepo.delete(
      id: id,
    );
  }
}
