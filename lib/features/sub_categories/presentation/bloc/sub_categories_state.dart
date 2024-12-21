import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
part 'sub_categories_state.freezed.dart';

@freezed
class SubCategoriesState with _$SubCategoriesState {
  const factory SubCategoriesState.initial() = _Initial;
  const factory SubCategoriesState.loaded() = _Loaded;
  const factory SubCategoriesState.loading() = _Loading;
  const factory SubCategoriesState.success() = _Success;
  const factory SubCategoriesState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Error;
}
