import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/product.dart';

abstract class ProductsRepo {
  Future<ApiResult<List<Product>?>> get({
    required int offerId,
  });

  Future<ApiResult<Product>> add({
    required FormData formData,
  });
  Future<ApiResult<void>> delete({
    required int id,
  });
  Future<ApiResult<void>> edit({
    required Product product,
  });
  Future<ApiResult<void>> editImage({
    required int id,
    required FormData formData,
  });
}
