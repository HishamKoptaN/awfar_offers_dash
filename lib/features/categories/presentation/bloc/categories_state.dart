import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/models/categories_response_model.dart';
part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.categoriesLoaded({
    required List<Category>? categories,
  }) = _CategoriesLoaded;
  const factory CategoriesState.loading() = _Loading;
  const factory CategoriesState.success() = _Success;
  const factory CategoriesState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Error;
}
