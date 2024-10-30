import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/add_category_request_body_model.dart';
import '../models/categories_response_model.dart';
part 'categories_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class CategoriesApi {
  factory CategoriesApi(
    Dio dio, {
    String baseUrl,
  }) = _CategoriesApi;
  @GET(
    ApiConstants.categories,
  )
  Future<List<Category>?> getCategories();
  //! Add Category
  @POST(ApiConstants.categories)
  Future<List<Category>?> addCategory({
    @Body() required AddCategoryRequestBodyModel addCategoryRequestBodyModel,
  });
  //! DELETE Country
  @DELETE('${ApiConstants.categories}/{id}')
  Future<List<Category>?> deleteCategory({
    @Path('id') required int id,
  });
}
