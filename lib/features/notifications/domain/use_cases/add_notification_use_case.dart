import '../../../../core/networking/api_result.dart';
import '../../data/model/notification.dart';
import '../../data/repo/notifications_repo.dart';

class AddNotificationUseCase {
  final NotificationsRepo notificationsRepo;
  AddNotificationUseCase(
    this.notificationsRepo,
  );
  Future<ApiResult<Notification>> add({
    required Notification notification,
  }) async {
    return await notificationsRepo.add(
      notification: notification,
    );
  }
}
