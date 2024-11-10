import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/add_governorate_request_model.dart';
import '../models/edit_governorate_request_model.dart';
import '../models/governorates_response_model.dart';
part 'governorates_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class GovernoratesApi {
  factory GovernoratesApi(
    Dio dio, {
    String baseUrl,
  }) = _GovernoratesApi;
  //! Get Governorates
  @GET(
    ApiConstants.governorates,
  )
  Future<List<Governorate>> get();
  //! Add Governorates
  @POST(ApiConstants.governorates)
  Future<Governorate> add({
    @Body() required AddGovernorateRequestModel addGovernorateRequestModel,
  });
  //! DELETE Governorate
  @DELETE('${ApiConstants.governorates}/{id}')
  Future<void> delete({
    @Path('id') required int id,
  });
  //! Edit offer
  @PUT(
    ApiConstants.governorates,
  )
  Future<Governorate> edit({
    @Body() required EditGovernorateRequestModel editGovernorateRequestModel,
  });
}
