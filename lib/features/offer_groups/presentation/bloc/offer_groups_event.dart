import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_offer_group_req_body_model.dart';
import '../../data/models/offer_group.dart';
part 'offer_groups_event.freezed.dart';

@freezed
class OfferGroupsEvent with _$OfferGroupsEvent {
  const factory OfferGroupsEvent.get({
    required int storeId,
  }) = _Get;
  const factory OfferGroupsEvent.add({
    required AddOfferGroupReqBodyModel addOfferGroupReqBodyModel,
  }) = _Add;
  const factory OfferGroupsEvent.delete({
    required int id,
  }) = _Delete;
  const factory OfferGroupsEvent.edit({
    required OfferGroup offerGroup,
  }) = _Edit;
}
