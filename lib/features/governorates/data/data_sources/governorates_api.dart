import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/add_governorate_request_model.dart';
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
  Future<List<Governorate>?> getGovernorates();
  //! Add Governorates
  @POST(ApiConstants.governorates)
  Future<List<Governorate>?> addGovernorate({
    @Body() required AddGovernorateRequestModel addGovernorateRequestModel,
  });
  //! DELETE Governorate
  @DELETE('${ApiConstants.governorates}/{id}')
  Future<List<Governorate>?> deleteGovernorate({
    @Path('id') required int id,
  });
}
