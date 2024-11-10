import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/sub_categories_response_model.dart';
part 'sub_categories_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class SubCategoriesApi {
  factory SubCategoriesApi(
    Dio dio, {
    String baseUrl,
  }) = _SubCategoriesApi;
  @GET(
    ApiConstants.subCategories,
  )
  Future<List<SubCategory>> get();
  //! Add SubCategory
  @POST(
    ApiConstants.subCategories,
  )
  Future<SubCategory> add({
    @Body() required FormData formData,
  });

  //! Edit offer
  @PUT(
    ApiConstants.subCategories,
  )
  Future<SubCategory> edit({
    @Body() required SubCategory subCategory,
  });
  //! Edit Image
  @PUT(
    '${ApiConstants.subCategories}/{id}',
  )
  Future<SubCategory> editImage({
    required int id,
    @Body() required FormData formData,
  });
  //! DELETE SubCategory
  @DELETE(
    '${ApiConstants.subCategories}/{id}',
  )
  Future<void> delete({
    @Path('id') required int id,
  });
}
