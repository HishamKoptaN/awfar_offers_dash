import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/categories_singletone.dart';
import '../../domain/use_cases/add_category_use_case.dart';
import '../../domain/use_cases/delete_category_use_case.dart';
import '../../domain/use_cases/edit_category_use_case.dart';
import '../../domain/use_cases/get_categories_use_case.dart';
import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  GetCategoriesUseCase categoriesUseCase;
  AddCategoryUseCase addCategoryUseCase;
  EditCategoryUseCase editUseCase;
  DeleteCategoryUseCase deleteUseCase;
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
                CategoriesSingleton.instance.categories = categories;
                emit(
                  const CategoriesState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
                emit(
                  const CategoriesState.loaded(),
                );
              },
            );
          },
          add: (addCategoryReqBodyModel) async {
            emit(
              const CategoriesState.loading(),
            );
            final result = await addCategoryUseCase.add(
              addCategoryReqBodyModel: addCategoryReqBodyModel,
            );
            await result.when(
              success: (
                category,
              ) async {
                CategoriesSingleton.instance.add(
                  category: category,
                );
                emit(
                  const CategoriesState.success(),
                );
                emit(
                  const CategoriesState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
                emit(
                  const CategoriesState.loaded(),
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
                category,
              ) async {
                CategoriesSingleton.instance.replace(
                  category: category,
                );

                emit(
                  const CategoriesState.success(),
                );
                emit(
                  const CategoriesState.loaded(),
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
                emit(
                  const CategoriesState.loaded(),
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
                CategoriesSingleton.instance.categories!.removeWhere(
                  (offer) => offer.id == id,
                );
                emit(
                  const CategoriesState.success(),
                );
                emit(
                  const CategoriesState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
                emit(
                  const CategoriesState.loaded(),
                );
              },
            );
          },
        );
      },
    );
  }
}
