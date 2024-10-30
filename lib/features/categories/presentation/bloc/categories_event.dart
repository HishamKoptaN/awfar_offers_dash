import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_category_request_body_model.dart';
part 'categories_event.freezed.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  const factory CategoriesEvent.getCategoriesEvent() = _GetCategoriesEvent;
  const factory CategoriesEvent.addCategoryEvent({
    required AddCategoryRequestBodyModel addCategoryRequestBodyModel,
  }) = _AddCategoryEvent;
}
