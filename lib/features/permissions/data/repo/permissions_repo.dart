import '../../../../../core/networking/api_result.dart';
import '../../data/model/permission.dart';

abstract class PermissionsRepo {
  Future<ApiResult<List<Permission>>> get();

  Future<ApiResult<Permission>> edit({
    required Permission permission,
  });
  Future<ApiResult<Permission>> add({
    required Permission permission,
  });
}
