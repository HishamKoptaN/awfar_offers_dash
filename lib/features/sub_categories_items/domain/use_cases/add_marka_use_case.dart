import '../../../../core/networking/api_result.dart';
import '../../data/models/add_marka_req_body_model.dart';
import '../../data/models/marka.dart';
import '../repo/markas_repo.dart';

class AddMarkaUseCase {
  final MarkasRepo markasRepo;
  AddMarkaUseCase({
    required this.markasRepo,
  });
  Future<ApiResult<Marka>> add({
    required AddMarkaReqBodyModel addMarkaReqBodyModel,
  }) async {
    return await markasRepo.add(
      addMarkaReqBodyModel: addMarkaReqBodyModel,
    );
  }
}
