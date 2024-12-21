import '../../../../../core/networking/api_result.dart';
import '../../data/model/roles_res_model.dart';
import '../../data/repo/roles_repo.dart';

class GetRolesUseCase {
  final RolesRepo rolesRepo;
  GetRolesUseCase({
    required this.rolesRepo,
  });
  Future<ApiResult<RolesResModel>> get() async {
    return await rolesRepo.get();
  }
}
