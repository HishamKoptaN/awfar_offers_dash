import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/sub_categories_response_model.dart';
import '../../domain/use_cases/add_sub_category_use_case.dart';
import '../../domain/use_cases/delete_sub_category_use_case.dart';
import '../../domain/use_cases/edit_sub_category_image_use_case.dart';
import '../../domain/use_cases/edit_sub_category_use_case.dart';
import '../../domain/use_cases/get_sub_categories_use_case.dart';
import 'sub_categories_event.dart';
import 'sub_categories_state.dart';

class SubCategoriesBloc extends Bloc<SubCategoriesEvent, SubCategoriesState> {
  final GetSubCategoriesUseCase getSubSubCategoriesUseCase;
  final AddSubCategoryUseCase addSubCategoryUseCase;
  final EditSubCategoryUseCase editUseCase;
  final DeleteSubCategoryUseCase deleteUseCase;
  final EditSubCategoryImageUseCase editImageUseCase;

  SubCategoriesBloc(
    this.getSubSubCategoriesUseCase,
    this.addSubCategoryUseCase,
    this.editUseCase,
    this.editImageUseCase,
    this.deleteUseCase,
  ) : super(
          const SubCategoriesState.initial(),
        ) {
    on<SubCategoriesEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            final result = await getSubSubCategoriesUseCase.get();
            await result.when(
              success: (subCategories) async {
                await SubCategoriesResponseModel().load(
                  subCategories: subCategories,
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  SubCategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
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
                SubCategoriesResponseModel().add(
                  subCategory: subCategory,
                );
                emit(
                  const SubCategoriesState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  SubCategoriesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          edit: (subCategory) async {
            emit(
              const SubCategoriesState.loading(),
            );
            final result = await editUseCase.edit(
              subCategory: subCategory,
            );
            await result.when(
              success: (
                offer,
              ) async {
                SubCategoriesResponseModel().replace(
                  subCategory: subCategory,
                );
                emit(
                  const SubCategoriesState.success(),
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
              },
            );
          },
          editImage: (
            id,
            formData,
          ) async {
            emit(
              const SubCategoriesState.loading(),
            );
            final result = await editImageUseCase.edit(
              id: id,
              formData: formData,
            );
            await result.when(
              success: (
                subCategory,
              ) async {
                SubCategoriesResponseModel().replace(
                  subCategory: subCategory,
                );
                emit(
                  const SubCategoriesState.success(),
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
                SubCategoriesResponseModel().delete(
                  id: id,
                );
                emit(
                  const SubCategoriesState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  SubCategoriesState.failure(
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
