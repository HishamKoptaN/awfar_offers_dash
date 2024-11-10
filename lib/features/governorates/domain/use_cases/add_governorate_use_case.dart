import '../../../../core/networking/api_result.dart';
import '../../data/models/add_governorate_request_model.dart';
import '../../data/models/governorates_response_model.dart';
import '../repo/governorates_repo.dart';

class AddGovernorateUseCase {
  final GovernoratesRepo governoratesRepo;
  AddGovernorateUseCase(
    this.governoratesRepo,
  );
  Future<ApiResult<Governorate>> add({
    required AddGovernorateRequestModel addGovernorateRequestModel,
  }) async {
    return await governoratesRepo.add(
      addGovernorateRequestModel: addGovernorateRequestModel,
    );
  }
}
