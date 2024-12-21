import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/product.dart';
import '../repo/products_repo.dart';

class AddProductUseCase {
  final ProductsRepo offersRepo;
  AddProductUseCase(
    this.offersRepo,
  );
  Future<ApiResult<Product>> addProduct({
    required FormData formData,
  }) async {
    return await offersRepo.add(
      formData: formData,
    );
  }
}
