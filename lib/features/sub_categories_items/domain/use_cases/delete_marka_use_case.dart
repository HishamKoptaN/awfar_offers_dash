import '../../../../core/networking/api_result.dart';
import '../repo/markas_repo.dart';

class DeleteMarkaUseCase {
  final MarkasRepo markasRepo;
  DeleteMarkaUseCase({
    required this.markasRepo,
  });
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    return await markasRepo.delete(
      id: id,
    );
  }
}
