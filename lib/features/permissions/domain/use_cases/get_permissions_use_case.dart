import '../../../../../core/networking/api_result.dart';
import '../../data/model/permission.dart';
import '../../data/repo/permissions_repo.dart';

class GetPermissionsUseCase {
  final PermissionsRepo permissionsRepo;
  GetPermissionsUseCase({
    required this.permissionsRepo,
  });
  Future<ApiResult<List<Permission>>> get() async {
    return await permissionsRepo.get();
  }
}
