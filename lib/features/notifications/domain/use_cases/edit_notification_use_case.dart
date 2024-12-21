import '../../../../core/networking/api_result.dart';
import '../../data/model/notification.dart';
import '../../data/repo/notifications_repo.dart';

class EditNotificationUseCase {
  final NotificationsRepo notificationsRepo;
  EditNotificationUseCase(
    this.notificationsRepo,
  );
  Future<ApiResult<Notification>> edit({
    required String message,
  }) async {
    return await notificationsRepo.edit(
      message: message,
    );
  }
}
