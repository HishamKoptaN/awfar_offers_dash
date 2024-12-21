// To parse this JSON data, do
//
//     final addOfferGroupReqBodyModel = addOfferGroupReqBodyModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_offer_group_req_body_model.freezed.dart';
part 'add_offer_group_req_body_model.g.dart';

AddOfferGroupReqBodyModel addOfferGroupReqBodyModelFromJson(String str) =>
    AddOfferGroupReqBodyModel.fromJson(json.decode(str));

String addOfferGroupReqBodyModelToJson(AddOfferGroupReqBodyModel data) =>
    json.encode(data.toJson());

@freezed
class AddOfferGroupReqBodyModel with _$AddOfferGroupReqBodyModel {
  const factory AddOfferGroupReqBodyModel({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "start_at") DateTime? startAt,
    @JsonKey(name: "end_at") DateTime? endAt,
  }) = _AddOfferGroupReqBodyModel;

  factory AddOfferGroupReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$AddOfferGroupReqBodyModelFromJson(json);
}
