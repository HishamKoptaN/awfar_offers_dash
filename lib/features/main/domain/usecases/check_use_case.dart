import '../../../../../core/networking/api_result.dart';
import '../../data/models/check_response_model.dart';
import '../repo/main_repo.dart';

class CheckUseCase {
  final MainRepo mainRepo;
  CheckUseCase(
    this.mainRepo,
  );
  Future<ApiResult<CheckResponseModel>> check() async {
    return await mainRepo.check();
  }
}
