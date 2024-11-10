import '../../../../core/networking/api_result.dart';
import '../../data/models/edit_governorate_request_model.dart';
import '../../data/models/governorates_response_model.dart';
import '../repo/governorates_repo.dart';

class EditGovernorateUseCase {
  final GovernoratesRepo governoratesRepo;
  EditGovernorateUseCase(
    this.governoratesRepo,
  );
  Future<ApiResult<Governorate>> edit({
    required EditGovernorateRequestModel editGovernorateRequestModel,
  }) async {
    return await governoratesRepo.edit(
      editGovernorateRequestModel: editGovernorateRequestModel,
    );
  }
}
