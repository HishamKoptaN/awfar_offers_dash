// To parse this JSON data, do
//
//     final addCountryRequestModel = addCountryRequestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'add_country_request_body_model.freezed.dart';
part 'add_country_request_body_model.g.dart';

AddCountryRequestModel addCountryRequestModelFromJson(String str) =>
    AddCountryRequestModel.fromJson(json.decode(str));

String addCountryRequestModelToJson(AddCountryRequestModel data) =>
    json.encode(data.toJson());

@freezed
class AddCountryRequestModel with _$AddCountryRequestModel {
  const factory AddCountryRequestModel({
    @JsonKey(name: "code") required String code,
  }) = _AddCountryRequestModel;

  factory AddCountryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddCountryRequestModelFromJson(json);
}
