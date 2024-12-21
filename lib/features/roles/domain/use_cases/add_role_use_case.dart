import '../../../../../core/networking/api_result.dart';
import '../../../../core/models/role.dart';
import '../../data/repo/roles_repo.dart';

class AddRoleUseCase {
  final RolesRepo rolesRepo;
  AddRoleUseCase(
    this.rolesRepo,
  );
  Future<ApiResult<Role>> add({
    required Role role,
  }) async {
    return await rolesRepo.add(
      role: role,
    );
  }
}
