import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/stores_repo.dart';
import '../data_sources/stores_api.dart';
import '../models/stores_response_model.dart';

class StoresRepoImpl implements StoresRepo {
  final StoresApi storesApi;
  StoresRepoImpl(
    this.storesApi,
  );
  @override
  Future<ApiResult<List<Store>?>> getStores() async {
    try {
      final response = await storesApi.getStores();
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
