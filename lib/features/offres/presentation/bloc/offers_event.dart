import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'offers_event.freezed.dart';

@freezed
class OffersEvent with _$OffersEvent {
  const factory OffersEvent.getOffersEvent() = _GetOffersEvent;
  const factory OffersEvent.addOfferEvent({
    required FormData formData,
  }) = _AddOfferEvent;
}
