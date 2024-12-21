import '../../../../core/networking/api_result.dart';
import '../model/notification.dart';

abstract class NotificationsRepo {
  Future<ApiResult<List<Notification>>> get();

  Future<ApiResult<Notification>> edit({
    required String message,
  });
  Future<ApiResult<Notification>> add({
    required Notification notification,
  });
  Future<ApiResult<void>> delete({
    required int id,
  });
}
