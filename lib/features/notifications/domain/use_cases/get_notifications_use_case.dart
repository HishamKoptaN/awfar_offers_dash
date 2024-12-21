import '../../../../core/networking/api_result.dart';
import '../../data/model/notification.dart';
import '../../data/repo/notifications_repo.dart';

class GetNotificationsUseCase {
  final NotificationsRepo notificationsRepo;
  GetNotificationsUseCase(
    this.notificationsRepo,
  );
  Future<ApiResult<List<Notification>>> get() async {
    return await notificationsRepo.get();
  }
}
