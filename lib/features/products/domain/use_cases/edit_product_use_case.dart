import '../../../../core/networking/api_result.dart';
import '../../data/models/product.dart';
import '../repo/products_repo.dart';

class EditProductUseCase {
  final ProductsRepo productsRepo;
  EditProductUseCase(
    this.productsRepo,
  );
  Future<ApiResult<void>> edit({
    required Product product,
  }) async {
    return await productsRepo.edit(
      product: product,
    );
  }
}
