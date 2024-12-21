import '../../../../../core/networking/api_result.dart';
import '../../../../core/models/user.dart';

abstract class MainRepo {
  Future<ApiResult<User>> check();
}
