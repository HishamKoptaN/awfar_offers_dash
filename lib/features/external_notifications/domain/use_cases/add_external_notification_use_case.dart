import '../../../../core/networking/api_result.dart';
import '../../data/repo/external_notifications_repo.dart';
import '../../data/model/external_notification.dart';

class AddExternalNotificationUseCase {
  final ExternalNotificationsRepo externalNotificationsRepo;

  AddExternalNotificationUseCase({
    required this.externalNotificationsRepo,
  });

  Future<ApiResult<void>> add({
    required ExternalNotification externalNotification,
  }) async {
    return await externalNotificationsRepo.add(
      externalNotification: externalNotification,
    );
  }
}
