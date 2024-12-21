import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/model/permission.dart';
import '../../data/repo/permissions_repo.dart';
import '../../data/data_sources/permissions_api.dart';

class PermissionsRepoImpl implements PermissionsRepo {
  final PermissionsApi permissionsApi;
  PermissionsRepoImpl(
    this.permissionsApi,
  );
  @override
  Future<ApiResult<List<Permission>>> get() async {
    try {
      final response = await permissionsApi.get();
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
  Future<ApiResult<Permission>> edit({
    required Permission permission,
  }) async {
    try {
      final response = await permissionsApi.edit(
        permission: permission,
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
  Future<ApiResult<Permission>> add({
    required Permission permission,
  }) async {
    try {
      final response = await permissionsApi.add(
        permission: permission,
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
