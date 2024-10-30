import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/add_offer_request_body_model.dart';
part 'offers_event.freezed.dart';

@freezed
class OffersEvent with _$OffersEvent {
  const factory OffersEvent.getOffersEvent() = _GetOffersEvent;
  const factory OffersEvent.addOfferEvent({
    required AddOfferRequestBodyModel addOfferRequestBodyModel,
  }) = _AddOfferEvent;
}
