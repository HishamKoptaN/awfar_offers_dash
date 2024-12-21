import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sub_categories_event.freezed.dart';

@freezed
class SubCategoriesEvent with _$SubCategoriesEvent {
  const factory SubCategoriesEvent.get() = _Get;
  const factory SubCategoriesEvent.add({
    required FormData formData,
  }) = _Add;
  const factory SubCategoriesEvent.edit({
    required int id,
    required FormData formData,
  }) = _Edit;
  const factory SubCategoriesEvent.delete({
    required int id,
  }) = _Delete;
}
