import '../../../../core/networking/api_result.dart';
import '../../data/model/notify_req_body.dart';
import '../../data/repo/users_repo.dart';

class NotifyUseCase {
  final UsersRepo usersRepo;
  NotifyUseCase(
    this.usersRepo,
  );
  Future<ApiResult<void>> notify({
    required NotifyReq notifyReq,
  }) async {
    return await usersRepo.notify(
      notifyReq: notifyReq,
    );
  }
}
