import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_sources/users_api.dart';
import '../../data/model/notify_req_body.dart';
import '../../data/repo/users_repo.dart';

class UsersRepoImpl implements UsersRepo {
  final UsersApi usersApi;
  UsersRepoImpl(
    this.usersApi,
  );
  @override
  Future<ApiResult<List<User>>> get() async {
    try {
      final response = await usersApi.get();
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
  Future<ApiResult<User>> edit({
    required User user,
  }) async {
    try {
      final response = await usersApi.edit(
        user: user,
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
  Future<ApiResult<User>> add({
    required User user,
  }) async {
    try {
      final response = await usersApi.add(
        user: user,
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
  Future<ApiResult<void>> notify({
    required NotifyReq notifyReq,
  }) async {
    try {
      await usersApi.notify(
        notifyReq: notifyReq,
      );
      return const ApiResult.success(
        data: null,
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
