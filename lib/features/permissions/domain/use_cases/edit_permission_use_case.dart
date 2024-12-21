import '../../../../../core/networking/api_result.dart';
import '../../data/model/permission.dart';
import '../../data/repo/permissions_repo.dart';

class EditPermissionUseCase {
  final PermissionsRepo permissionsRepo;
  EditPermissionUseCase({
    required this.permissionsRepo,
  });
  Future<ApiResult<Permission>> edit({
    required Permission permission,
  }) async {
    return await permissionsRepo.edit(
      permission: permission,
    );
  }
}
