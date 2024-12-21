import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/products_singleton.dart';
import '../../domain/use_cases/add_product_use_case.dart';
import '../../domain/use_cases/delete_product_use_case.dart';
import '../../domain/use_cases/edit_product_use_case.dart';
import '../../domain/use_cases/get_products_use_case.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase getProductsUseCase;
  final AddProductUseCase addProductsUseCase;
  final EditProductUseCase editUseCase;
  final DeleteProductUseCase deleteUseCase;
  ProductsBloc({
    required this.getProductsUseCase,
    required this.addProductsUseCase,
    required this.editUseCase,
    required this.deleteUseCase,
  }) : super(
          const ProductsState.initial(),
        ) {
    on<ProductsEvent>(
      (event, emit) async {
        await event.when(
          get: (offerId) async {
            emit(
              const ProductsState.loading(),
            );
            final result = await getProductsUseCase.getProducts(
              offerId: offerId,
            );
            await result.when(
              success: (prdoucts) async {
                ProductsSingleton.instance.products = prdoucts;
                emit(
                  const ProductsState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  ProductsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (formData) async {
            emit(
              const ProductsState.loading(),
            );
            final result = await addProductsUseCase.addProduct(
              formData: formData,
            );
            await result.when(
              success: (
                prdouct,
              ) async {
                emit(
                  const ProductsState.success(),
                );
              },
              failure: (error) async {
                emit(
                  ProductsState.failure(
                    apiErrorModel: error,
                  ),
                );
              },
            );
          },
          edit: (product) async {
            emit(
              const ProductsState.loading(),
            );
            final result = await editUseCase.edit(
              product: product,
            );
            await result.when(
              success: (
                prdouct,
              ) async {
                emit(
                  const ProductsState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  ProductsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
