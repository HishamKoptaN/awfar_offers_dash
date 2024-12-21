import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/sign_up_request_body.dart';
part 'sign_up_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiAuthBaseUrl,
)
abstract class SignUpApi {
  factory SignUpApi(
    Dio dio, {
    String baseUrl,
  }) = _SignUpApi;
  @POST(
    ApiConstants.signup,
  )
  Future<Auth> signUp({
    @Body() required SignUpRequestBody signUpRequestBody,
  });
}
