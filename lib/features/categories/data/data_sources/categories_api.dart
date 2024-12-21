import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/add_category_req_body_model.dart';
import '../models/category.dart';
part 'categories_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class CategoriesApi {
  factory CategoriesApi(
    Dio dio, {
    String baseUrl,
  }) = _CategoriesApi;
  //! Get categories
  @GET(
    ApiConstants.categories,
  )
  Future<List<Category>?> get();
  //! Add Category
  @POST(
    ApiConstants.categories,
  )
  Future<Category> addCategory({
    @Body() required AddCategoryReqBodyModel addCategoryReqBodyModel,
  });
  //! Edit Category
  @PATCH(
    ApiConstants.categories,
  )
  Future<Category> edit({
    @Body() required Category category,
  });
  //! DELETE Category
  @DELETE(
    '${ApiConstants.categories}/{id}',
  )
  Future<void> delete({
    @Path('id') required int id,
  });
}
