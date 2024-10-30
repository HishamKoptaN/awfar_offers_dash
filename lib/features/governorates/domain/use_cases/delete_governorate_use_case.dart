import '../../../../core/networking/api_result.dart';
import '../../data/models/governorates_response_model.dart';
import '../repo/governorates_repo.dart';

class DeleteGovernorateUseCase {
  final GovernoratesRepo governoratesRepo;
  DeleteGovernorateUseCase(
    this.governoratesRepo,
  );
  Future<ApiResult<List<Governorate>?>> deleteCountry({
    required int id,
  }) async {
    return await governoratesRepo.deleteGovernorate(
      id: id,
    );
  }
}
