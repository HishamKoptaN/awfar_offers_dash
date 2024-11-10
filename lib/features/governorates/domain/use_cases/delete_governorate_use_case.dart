import '../../../../core/networking/api_result.dart';
import '../repo/governorates_repo.dart';

class DeleteGovernorateUseCase {
  final GovernoratesRepo governoratesRepo;
  DeleteGovernorateUseCase(
    this.governoratesRepo,
  );
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    return await governoratesRepo.delete(
      id: id,
    );
  }
}
