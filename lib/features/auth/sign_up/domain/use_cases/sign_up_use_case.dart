import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/sign_up_request_body.dart';
import '../repo/sign_up_repo.dart';

class SignUpUseCase {
  final SignUpRepo signUpRepo;
  SignUpUseCase(
    this.signUpRepo,
  );
  Future<ApiResult<Auth>> signUp({
    required SignUpRequestBody signUpRequestBody,
  }) async {
    return await signUpRepo.signUp(
      signUpRequestBody: signUpRequestBody,
    );
  }
}
