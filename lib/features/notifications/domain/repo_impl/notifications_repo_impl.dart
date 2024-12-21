import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_sources/notifications_api.dart';
import '../../data/model/notification.dart';
import '../../data/repo/notifications_repo.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  final NotificationsApi notificationsApi;
  NotificationsRepoImpl(
    this.notificationsApi,
  );
  @override
  Future<ApiResult<List<Notification>>> get() async {
    try {
      final response = await notificationsApi.get();
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
  Future<ApiResult<Notification>> edit({
    required String message,
  }) async {
    try {
      final response = await notificationsApi.edit(
        message: message,
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
  Future<ApiResult<Notification>> add({
    required Notification notification,
  }) async {
    try {
      final response = await notificationsApi.add(
        notification: notification,
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
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    try {
      await notificationsApi.delete(
        id: id,
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
