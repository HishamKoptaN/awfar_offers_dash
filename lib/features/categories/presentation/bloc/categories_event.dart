import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_category_request_body_model.dart';
import '../../data/models/categories_response_model.dart';
part 'categories_event.freezed.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  const factory CategoriesEvent.get() = _GetCategoriesEvent;
  const factory CategoriesEvent.add({
    required AddCategoryRequestBodyModel addCategoryRequestBodyModel,
  }) = _AddCategoryEvent;
  const factory CategoriesEvent.delete({
    required int id,
  }) = _Delete;
  const factory CategoriesEvent.edit({
    required Category category,
  }) = _Edit;
}
