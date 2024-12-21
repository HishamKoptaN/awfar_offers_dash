import '../../../../core/networking/api_result.dart';
import '../model/external_notification.dart';

abstract class ExternalNotificationsRepo {
  Future<ApiResult<void>> add({
    required ExternalNotification externalNotification,
  });
}
