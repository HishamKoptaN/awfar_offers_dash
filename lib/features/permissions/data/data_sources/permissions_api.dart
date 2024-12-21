import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../model/permission.dart';
part 'permissions_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class PermissionsApi {
  factory PermissionsApi(
    Dio dio, {
    String baseUrl,
  }) = _PermissionsApi;
  //! Get
  @GET(
    ApiConstants.permissions,
  )
  Future<List<Permission>> get();
  //! Edit
  @PATCH(
    ApiConstants.permissions,
  )
  Future<Permission> edit({
    @Body() required Permission permission,
  });
  //! Add
  @POST(
    ApiConstants.permissions,
  )
  Future<Permission> add({
    @Body() required Permission permission,
  });
}
