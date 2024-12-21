import '../../../../core/networking/api_result.dart';
import '../../data/models/product.dart';
import '../repo/products_repo.dart';

class GetProductsUseCase {
  final ProductsRepo offersRepo;
  GetProductsUseCase(
    this.offersRepo,
  );
  Future<ApiResult<List<Product>?>> getProducts({
    required int offerId,
  }) async {
    return await offersRepo.get(
      offerId: offerId,
    );
  }
}
