import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/notification.dart';
part 'notifications_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class NotificationsApi {
  factory NotificationsApi(
    Dio dio, {
    String baseUrl,
  }) = _NotificationsApi;
  //! Get
  @GET(
    ApiConstants.notifications,
  )
  Future<List<Notification>> get();
  //! Edit
  @PATCH(
    ApiConstants.notifications,
  )
  Future<Notification> edit({
    @Body() required String message,
  });
  //! Add
  @POST(
    ApiConstants.notifications,
  )
  Future<Notification> add({
    @Body() required Notification notification,
  });
  //! Delete
  @DELETE(
    '${ApiConstants.notifications}/{id}',
  )
  Future<void> delete({
    @Path('id') required int id,
  });
}
