import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../core/models/user.dart';
import '../../domain/repo/main_repo.dart';
import '../datasources/main_api.dart';

class MainRepoImpl implements MainRepo {
  final MainApi mainApi;
  MainRepoImpl(
    this.mainApi,
  );

  @override
  Future<ApiResult<User>> check() async {
    try {
      final response = await mainApi.check();
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
