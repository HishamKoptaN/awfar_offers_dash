import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_category_req_body_model.dart';
import '../../data/models/category.dart';
part 'categories_event.freezed.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  const factory CategoriesEvent.get() = _Get;
  const factory CategoriesEvent.add({
    required AddCategoryReqBodyModel addCategoryReqBodyModel,
  }) = _Add;
  const factory CategoriesEvent.delete({
    required int id,
  }) = _Delete;
  const factory CategoriesEvent.edit({
    required Category category,
  }) = _Edit;
}
