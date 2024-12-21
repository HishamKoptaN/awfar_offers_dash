// // To parse this JSON data, do
// //
// //     final addCategoryReqBodyModel = addCategoryReqBodyModelFromJson(jsonString);

// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'dart:convert';

// part 'add_category_req_body_model.freezed.dart';
// part 'add_category_req_body_model.g.dart';

// AddCategoryReqBodyModel addCategoryReqBodyModelFromJson(String str) =>
//     AddCategoryReqBodyModel.fromJson(json.decode(str));

// String addCategoryReqBodyModelToJson(AddCategoryReqBodyModel data) =>
//     json.encode(data.toJson());

// @freezed
// class AddCategoryReqBodyModel with _$AddCategoryReqBodyModel {
//   const factory AddCategoryReqBodyModel({
//     @JsonKey(name: "name") String? name,
//   }) = _AddCategoryReqBodyModel;

//   factory AddCategoryReqBodyModel.fromJson(Map<String, dynamic> json) =>
//       _$AddCategoryReqBodyModelFromJson(json);
// }
