import '../../../../../core/networking/api_result.dart';
import '../../../../core/models/role.dart';
import '../model/roles_res_model.dart';

abstract class RolesRepo {
  Future<ApiResult<RolesResModel>> get();

  Future<ApiResult<Role>> edit({
    required Role role,
  });
  Future<ApiResult<Role>> add({
    required Role role,
  });
}
