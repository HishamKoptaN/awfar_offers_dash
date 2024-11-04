import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/sub_categories_response_model.dart';
import '../../domain/use_cases/add_sub_category_use_case.dart';
import '../../domain/use_cases/get_sub_categories_use_case.dart';
import 'sub_categories_event.dart';
import 'sub_categories_state.dart';

class SubCategoriesBloc extends Bloc<SubCategoriesEvent, SubCategoriesState> {
  final GetSubCategoriesUseCase getSubCategoriesUseCase;
  final AddSubCategoryUseCase addSubCategoryUseCase;

  SubCategoriesBloc(
    this.getSubCategoriesUseCase,
    this.addSubCategoryUseCase,
  ) : super(
          const SubCategoriesState.initial(),
        ) {
    on<SubCategoriesEvent>(
      (event, emit) async {
        await event.when(getSubCategoriesEvent: () async {
          final result = await getSubCategoriesUseCase.getSubCategories();
          await result.when(
            success: (categories) async {
              await SubCategoriesResponseModel().loadCategories(
                subCategories: categories,
              );
              emit(
                SubCategoriesState.subCategoriesLoaded(
                  categories: categories,
                ),
              );
            },
            failure: (error) async {
              emit(
                SubCategoriesState.failure(
                  error: error.error!,
                ),
              );
            },
          );
        }, addSubCategoryEvent: (formData) async {
          emit(
            const SubCategoriesState.loading(),
          );
          final result = await addSubCategoryUseCase.addSubCategory(
            formData: formData,
          );
          await result.when(
            success: (
              governoratesResponseModel,
            ) async {
              emit(
                const SubCategoriesState.success(),
              );
            },
            failure: (error) async {
              emit(
                SubCategoriesState.failure(
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
