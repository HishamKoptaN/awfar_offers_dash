import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/add_marka_req_body_model.dart';
import '../models/marka.dart';
part 'markas_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class MarkasApi {
  factory MarkasApi(
    Dio dio, {
    String baseUrl,
  }) = _MarkasApi;

  // ! get getMarkas
  @GET(
    '${ApiConstants.markas}/{id}',
  )
  Future<List<Marka>> get({
    @Path('id') required int id,
  });
  //! Add Marka
  @POST(
    ApiConstants.markas,
  )
  Future<Marka> add({
    @Body() required AddMarkaReqBodyModel addMarkaReqBodyModel,
  });
  //! Edit SubCategory
  @PATCH(
    ApiConstants.markas,
  )
  Future<Marka> edit({
    @Body() required Marka subCategoryItem,
  });
  //! DELETE SubCategory
  @DELETE(
    '${ApiConstants.markas}/{id}',
  )
  Future<void> delete({
    @Path('id') required int id,
  });
}
