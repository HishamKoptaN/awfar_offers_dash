import '../../../../../core/networking/api_result.dart';
import '../../../../core/models/role.dart';
import '../../data/repo/roles_repo.dart';

class EditRoleUseCase {
  final RolesRepo rolesRepo;
  EditRoleUseCase({
    required this.rolesRepo,
  });
  Future<ApiResult<Role>> edit({
    required Role role,
  }) async {
    return await rolesRepo.edit(
      role: role,
    );
  }
}
