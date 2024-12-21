import '../../../../core/networking/api_result.dart';
import '../../data/models/marka.dart';
import '../repo/markas_repo.dart';

class GetMarkasUseCase {
  final MarkasRepo markasRepo;
  GetMarkasUseCase({
    required this.markasRepo,
  });
  Future<ApiResult<List<Marka>>> get({
    required int id,
  }) async {
    return await markasRepo.get(
      id: id,
    );
  }
}
