import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/sign_up_request_body.dart';

abstract class SignUpRepo {
  Future<ApiResult<Auth>> signUp({
    required SignUpRequestBody signUpRequestBody,
  });
}
