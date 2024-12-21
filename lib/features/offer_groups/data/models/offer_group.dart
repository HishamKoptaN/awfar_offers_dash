// To parse this JSON data, do
//
//     final offerGroup = offerGroupFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import '../../../../core/models/offer.dart';
part 'offer_group.freezed.dart';
part 'offer_group.g.dart';

List<OfferGroup> offerGroupFromJson(String str) =>
    List<OfferGroup>.from(json.decode(str).map((x) => OfferGroup.fromJson(x)));

String offerGroupToJson(List<OfferGroup> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class OfferGroup with _$OfferGroup {
  const factory OfferGroup({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "start_at") dynamic startAt,
    @JsonKey(name: "end_at") DateTime? endAt,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "days_remaining") String? daysRemaining,
    @JsonKey(name: "offers") List<Offer>? offers,
  }) = _OfferGroup;

  factory OfferGroup.fromJson(Map<String, dynamic> json) =>
      _$OfferGroupFromJson(json);
}
