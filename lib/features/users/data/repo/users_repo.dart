import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';
import '../model/notify_req_body.dart';

abstract class UsersRepo {
  Future<ApiResult<List<User>>> get();
  Future<ApiResult<void>> notify({
    required NotifyReq notifyReq,
  });
  Future<ApiResult<User>> edit({
    required User user,
  });
  Future<ApiResult<User>> add({
    required User user,
  });
}
