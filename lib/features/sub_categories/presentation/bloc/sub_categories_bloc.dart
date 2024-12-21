import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/sub_categories_singletone.dart';
import '../../domain/use_cases/add_sub_category_use_case.dart';
import '../../domain/use_cases/delete_sub_category_use_case.dart';
import '../../domain/use_cases/edit_sub_category_use_case.dart';
import '../../domain/use_cases/get_sub_categories_use_case.dart';
import 'sub_categories_event.dart';
import 'sub_categories_state.dart';

class SubCategoriesBloc extends Bloc<SubCategoriesEvent, SubCategoriesState> {
  final GetSubCategoriesUseCase getSubSubCategoriesUseCase;
  final AddSubCategoryUseCase addSubCategoryUseCase;
  final EditSubCategoryUseCase editUseCase;
  final DeleteSubCategoryUseCase deleteUseCase;

  SubCategoriesBloc(
    this.getSubSubCategoriesUseCase,
    this.addSubCategoryUseCase,
    this.editUseCase,
    this.deleteUseCase,
  ) : super(
          const SubCategoriesState.initial(),
        ) {
    on<SubCategoriesEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const SubCategoriesState.loading(),
            );
            final result = await getSubSubCategoriesUseCase.get();
            await result.when(
              success: (subCategories) async {
                SubCategoriesSingleton.instance.subCategories = subCategories;
                emit(
                  const SubCategoriesState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  SubCategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
                emit(
                  const SubCategoriesState.loaded(),
                );
              },
            );
          },
          add: (formData) async {
            emit(
              const SubCategoriesState.loading(),
            );
            final result = await addSubCategoryUseCase.add(
              formData: formData,
            );
            await result.when(
              success: (
                subCategory,
              ) async {
                SubCategoriesSingleton.instance.add(
                  subCategory: subCategory,
                );
                emit(
                  const SubCategoriesState.success(),
                );
                emit(
                  const SubCategoriesState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  SubCategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
                emit(
                  const SubCategoriesState.loaded(),
                );
              },
            );
          },
          edit: (
            id,
            formData,
          ) async {
            emit(
              const SubCategoriesState.loading(),
            );
            final result = await editUseCase.edit(
              id: id,
              formData: formData,
            );
            await result.when(
              success: (
                subCategory,
              ) async {
                SubCategoriesSingleton.instance.replace(
                  subCategory: subCategory,
                );
                emit(
                  const SubCategoriesState.success(),
                );
                emit(
                  const SubCategoriesState.loaded(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  SubCategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
                emit(
                  const SubCategoriesState.loaded(),
                );
              },
            );
          },
          delete: (
            id,
          ) async {
            emit(
              const SubCategoriesState.loading(),
            );
            final result = await deleteUseCase.delete(
              id: id,
            );
            await result.when(
              success: (_) async {
                SubCategoriesSingleton.instance.delete(
                  id: id,
                );
                emit(
                  const SubCategoriesState.success(),
                );
                emit(
                  const SubCategoriesState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  SubCategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
                emit(
                  const SubCategoriesState.loaded(),
                );
              },
            );
          },
        );
      },
    );
  }
}
