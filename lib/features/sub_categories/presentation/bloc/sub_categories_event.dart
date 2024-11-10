import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/sub_categories_response_model.dart';
part 'sub_categories_event.freezed.dart';

@freezed
class SubCategoriesEvent with _$SubCategoriesEvent {
  const factory SubCategoriesEvent.get() = _Get;
  const factory SubCategoriesEvent.add({
    required FormData formData,
  }) = _Add;
  const factory SubCategoriesEvent.edit({
    required SubCategory subCategory,
  }) = _Edit;
  const factory SubCategoriesEvent.delete({
    required int id,
  }) = _Delete;
  const factory SubCategoriesEvent.editImage({
    required int id,
    required FormData formData,
  }) = _EditImage;
}
