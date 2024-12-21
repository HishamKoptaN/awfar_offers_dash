import '../../../../core/networking/api_result.dart';
import '../../data/models/marka.dart';
import '../repo/markas_repo.dart';

class EditMarkaUseCase {
  final MarkasRepo markasRepo;
  EditMarkaUseCase({
    required this.markasRepo,
  });
  Future<ApiResult<Marka>> edit({
    required Marka marka,
  }) async {
    return await markasRepo.edit(
      subCategoryItem: marka,
    );
  }
}
