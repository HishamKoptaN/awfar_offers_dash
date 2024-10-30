import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/check_response_model.dart';
part 'main_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class MainApi {
  factory MainApi(
    Dio dio, {
    String baseUrl,
  }) = _MainApi;
  @POST(
    ApiConstants.check,
  )
  Future<CheckResponseModel> check();
}
