import '../../../../core/networking/api_result.dart';
import '../../data/repo/notifications_repo.dart';

class DeleteNotificationUseCase {
  final NotificationsRepo notificationsRepo;
  DeleteNotificationUseCase(
    this.notificationsRepo,
  );
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    return await notificationsRepo.delete(
      id: id,
    );
  }
}
