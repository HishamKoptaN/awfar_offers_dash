import '../../../../../core/networking/api_result.dart';
import '../../data/model/permission.dart';
import '../../data/repo/permissions_repo.dart';

class AddPermissionUseCase {
  final PermissionsRepo permissionsRepo;
  AddPermissionUseCase({
    required this.permissionsRepo,
  });
  Future<ApiResult<Permission>> add({
    required Permission permission,
  }) async {
    return await permissionsRepo.add(
      permission: permission,
    );
  }
}
