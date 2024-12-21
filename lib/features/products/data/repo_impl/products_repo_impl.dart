import 'package:dio/dio.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/products_repo.dart';
import '../data_sources/products_api.dart';
import '../models/product.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ProductsApi productsApi;
  ProductsRepoImpl(
    this.productsApi,
  );
  @override
  Future<ApiResult<List<Product>?>> get({
    required int offerId,
  }) async {
    try {
      final response = await productsApi.getProducts(
        offerId: offerId,
      );
      return ApiResult.success(
        data: response!,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<Product>> add({
    required FormData formData,
  }) async {
    try {
      final response = await productsApi.addProduct(
        formData: formData,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<Product>> edit({
    required Product product,
  }) async {
    try {
      await productsApi.edit(
        product: product,
      );
      return ApiResult.success(
        data: product,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<Product>> editImage({
    required int id,
    required FormData formData,
  }) async {
    try {
      final product = await productsApi.editImage(
        id: id,
        formData: formData,
      );
      return ApiResult.success(
        data: product,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    try {
      await productsApi.delete(
        id: id,
      );
      return const ApiResult.success(
        data: null,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
