import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_sub_category_request_body_model.dart';
part 'sub_categories_event.freezed.dart';

@freezed
class SubCategoriesEvent with _$SubCategoriesEvent {
  const factory SubCategoriesEvent.getSubCategoriesEvent() =
      _GetCategoriesEvent;
  const factory SubCategoriesEvent.addSubCategoryEvent({
    required AddSubCategoryRequestBodyModel addCategoryRequestBodyModel,
  }) = _AddCategoryEvent;
}
