import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../domain/repo/main_repo.dart';
import '../datasources/main_api.dart';
import '../models/check_response_model.dart';

class MainRepoImpl implements MainRepo {
  final MainApi mainApi;
  MainRepoImpl(
    this.mainApi,
  );

  @override
  Future<ApiResult<CheckResponseModel>> check() async {
    try {
      final response = await mainApi.check();
      return ApiResult.success(
        response,
      );
    } catch (error) {
      return ApiResult.failure(
        ApiErrorHandler.handle(
          error,
        ),
      );
    }
  }
}
