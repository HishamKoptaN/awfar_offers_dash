import '../../../../core/networking/api_result.dart';
import '../repo/products_repo.dart';

class DeleteProductUseCase {
  final ProductsRepo productsRepo;
  DeleteProductUseCase(
    this.productsRepo,
  );
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    return await productsRepo.delete(
      id: id,
    );
  }
}
