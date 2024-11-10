import '../../../../core/networking/api_result.dart';
import '../../data/models/governorates_response_model.dart';
import '../repo/governorates_repo.dart';

class GetGovernoratesUseCase {
  final GovernoratesRepo governoratesRepo;
  GetGovernoratesUseCase(
    this.governoratesRepo,
  );
  Future<ApiResult<List<Governorate>?>> get() async {
    return await governoratesRepo.get();
  }
}
