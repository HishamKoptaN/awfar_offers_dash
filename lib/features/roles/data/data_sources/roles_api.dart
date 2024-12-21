import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../core/models/role.dart';
import '../model/roles_res_model.dart';
part 'roles_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class RolesApi {
  factory RolesApi(
    Dio dio, {
    String baseUrl,
  }) = _RolesApi;
  //! Get
  @GET(
    ApiConstants.roles,
  )
  Future<RolesResModel> get();
  //! Edit
  @PATCH(
    ApiConstants.roles,
  )
  Future<Role> edit({
    @Body() required Role role,
  }); //! Add
  @POST(
    ApiConstants.roles,
  )
  Future<Role> add({
    @Body() required Role role,
  });
}
