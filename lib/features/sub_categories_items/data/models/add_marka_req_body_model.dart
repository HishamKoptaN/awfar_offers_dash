// To parse this JSON data, do
//
//     final addMarkaReqBodyModel = addMarkaReqBodyModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_marka_req_body_model.freezed.dart';
part 'add_marka_req_body_model.g.dart';

AddMarkaReqBodyModel addMarkaReqBodyModelFromJson(String str) =>
    AddMarkaReqBodyModel.fromJson(json.decode(str));

String addMarkaReqBodyModelToJson(AddMarkaReqBodyModel data) =>
    json.encode(data.toJson());

@freezed
class AddMarkaReqBodyModel with _$AddMarkaReqBodyModel {
  const factory AddMarkaReqBodyModel({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "sub_category_id") int? subCategoryId,
  }) = _AddMarkaReqBodyModel;

  factory AddMarkaReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$AddMarkaReqBodyModelFromJson(json);
}
