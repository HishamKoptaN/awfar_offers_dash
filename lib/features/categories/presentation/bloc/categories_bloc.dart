import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/categories_response_model.dart';
import '../../domain/use_cases/add_category_use_case.dart';
import '../../domain/use_cases/delete_category_use_case.dart';
import '../../domain/use_cases/edit_category_use_case.dart';
import '../../domain/use_cases/get_categories_use_case.dart';
import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase categoriesUseCase;
  final AddCategoryUseCase addCategoryUseCase;
  final EditCategoryUseCase editUseCase;
  final DeleteCategoryUseCase deleteUseCase;
  CategoriesBloc(
    this.categoriesUseCase,
    this.addCategoryUseCase,
    this.editUseCase,
    this.deleteUseCase,
  ) : super(
          const CategoriesState.initial(),
        ) {
    on<CategoriesEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            final result = await categoriesUseCase.getCategories();
            await result.when(
              success: (categories) async {
                await CategoriesResponseModel().load(
                  categories: categories,
                );
                emit(
                  CategoriesState.categoriesLoaded(
                    categories: categories,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (addCategoryRequestBodyModel) async {
            emit(
              const CategoriesState.loading(),
            );
            final result = await addCategoryUseCase.add(
              addCategoryRequestBodyModel: addCategoryRequestBodyModel,
            );
            await result.when(
              success: (
                governoratesResponseModel,
              ) async {
                //  CategoriesResponseModel().add(category: )
                emit(
                  const CategoriesState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          edit: (category) async {
            emit(
              const CategoriesState.loading(),
            );
            final result = await editUseCase.edit(
              category: category,
            );
            await result.when(
              success: (
                offer,
              ) async {
                emit(
                  const CategoriesState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  CategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          delete: (
            id,
          ) async {
            emit(
              const CategoriesState.loading(),
            );
            final result = await deleteUseCase.delete(
              id: id,
            );
            await result.when(
              success: (_) async {
                CategoriesResponseModel().categories!.removeWhere(
                      (offer) => offer.id == id,
                    );
                emit(
                  const CategoriesState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CategoriesState.failure(
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
