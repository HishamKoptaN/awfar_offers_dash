import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/categories_response_model.dart';
import '../../domain/use_cases/add_category_use_case.dart';
import '../../domain/use_cases/get_categories_use_case.dart';
import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase categoriesUseCase;
  final AddCategoryUseCase addCategoryUseCase;

  CategoriesBloc(
    this.categoriesUseCase,
    this.addCategoryUseCase,
  ) : super(
          const CategoriesState.initial(),
        ) {
    on<CategoriesEvent>(
      (event, emit) async {
        await event.when(getCategoriesEvent: () async {
          final result = await categoriesUseCase.getCategories();
          await result.when(
            success: (categories) async {
              await CategoriesResponseModel().loadCategories(
                categories: categories,
              );
              emit(
                CategoriesState.categoriesLoaded(
                  categories: categories,
                ),
              );
            },
            failure: (error) async {
              emit(
                CategoriesState.failure(
                  error: error.error!,
                ),
              );
            },
          );
        }, addCategoryEvent: (addCategoryRequestBodyModel) async {
          emit(
            const CategoriesState.loading(),
          );
          final result = await addCategoryUseCase.addCategory(
            addCategoryRequestBodyModel: addCategoryRequestBodyModel,
          );
          await result.when(
            success: (
              governoratesResponseModel,
            ) async {
              emit(
                const CategoriesState.success(),
              );
            },
            failure: (error) async {
              emit(
                CategoriesState.failure(
                  error: error.error!,
                ),
              );
            },
          );
        });
      },
    );
  }
}
