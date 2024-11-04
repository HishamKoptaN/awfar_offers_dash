import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/add_sub_category_request_body_model.dart';
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
  Future<List<SubCategory>?> getSubCategories();
  //! Add SubCategory
  @POST(
    ApiConstants.subCategories,
  )
  Future<List<SubCategory>?> addSubSubCategory({
    @Body() required FormData formData,
  });
  //! DELETE Country
  @DELETE(
    '${ApiConstants.subCategories}/{id}',
  )
  Future<List<SubCategory>?> deleteSubCategory({
    @Path('id') required int id,
  });
}
