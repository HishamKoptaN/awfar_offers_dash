import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'external_notifications_api.g.dart';

@RestApi(baseUrl: "https://fcm.googleapis.com")
abstract class ExternalNotificationsApi {
  factory ExternalNotificationsApi(
    Dio dio, {
    String baseUrl,
  }) = _ExternalNotificationsApi;

  @POST(
    "/v1/projects/com-awfaroffers-app-dev/messages:send",
  )
  Future<HttpResponse> sendNotificationToTopic({
    @Header("Authorization") required String authorization,
    @Body() required Map<String, dynamic> body,
  });
}
