import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/product.dart';
part 'products_api.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProductsApi {
  factory ProductsApi(
    Dio dio, {
    String? baseUrl,
  }) = _ProductsApi;

  //! GET Products
  @GET(
    '${ApiConstants.products}/{offerId}',
  )
  Future<List<Product>?> getProducts({
    @Path('offerId') required int offerId,
  });

  //! Add Product
  @POST(
    ApiConstants.products,
  )
  Future<Product> addProduct({
    @Body() required FormData formData,
  });

  //! Edit product
  @PUT(
    ApiConstants.products,
  )
  Future<Product> edit({
    @Body() required Product product,
  });
  //! Edit Image
  @PUT(
    '${ApiConstants.products}/{id}',
  )
  Future editImage({
    required int id,
    @Body() required FormData formData,
  }); //! DELETE product
  @DELETE(
    '${ApiConstants.products}/{id}',
  )
  Future<void> delete({
    @Path('id') required int id,
  });
}
