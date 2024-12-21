import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/models/user.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/notify_req_body.dart';
part 'users_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class UsersApi {
  factory UsersApi(
    Dio dio, {
    String baseUrl,
  }) = _UsersApi;

  //! Get
  @GET(
    ApiConstants.users,
  )
  Future<List<User>> get();

  //! Notify
  @POST(
    ApiConstants.users,
  )
  Future<void> notify({
    @Body() required NotifyReq notifyReq,
  });

  //! Edit
  @PATCH(
    ApiConstants.users,
  )
  Future<User> edit({
    @Body() required User user,
  });

  //! Add
  @POST(
    ApiConstants.users,
  )
  Future<User> add({
    @Body() required User user,
  });
}
