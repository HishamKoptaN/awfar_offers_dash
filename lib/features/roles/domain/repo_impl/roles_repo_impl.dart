import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../core/models/role.dart';
import '../../data/model/roles_res_model.dart';
import '../../data/repo/roles_repo.dart';
import '../../data/data_sources/roles_api.dart';

class RolesRepoImpl implements RolesRepo {
  final RolesApi rolesApi;
  RolesRepoImpl(
    this.rolesApi,
  );
  @override
  Future<ApiResult<RolesResModel>> get() async {
    try {
      final response = await rolesApi.get();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<Role>> edit({
    required Role role,
  }) async {
    try {
      final response = await rolesApi.edit(
        role: role,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<Role>> add({
    required Role role,
  }) async {
    try {
      final response = await rolesApi.add(
        role: role,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
