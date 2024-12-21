import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/notification_helper.dart';
import '../../data/model/external_notification.dart';
import '../../data/data_sources/external_notifications_api.dart';
import '../../data/repo/external_notifications_repo.dart';

class ExternalNotificationsRepoImpl implements ExternalNotificationsRepo {
  final ExternalNotificationsApi externalNotificationsApi;

  ExternalNotificationsRepoImpl({
    required this.externalNotificationsApi,
  });

  @override
  Future<ApiResult<void>> add({
    required ExternalNotification externalNotification,
  }) async {
    try {
      var serverKeyAuthorization = await NotificationsHelper().getAccessToken();
      await externalNotificationsApi.sendNotificationToTopic(
        authorization: 'Bearer $serverKeyAuthorization',
        body: {
          'message': {
            'topic': externalNotification.topic,
            'notification': {
              'title': externalNotification.title,
              'body': externalNotification.message,
            },
            "android": {
              "priority": "HIGH",
            }
          },
        },
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
