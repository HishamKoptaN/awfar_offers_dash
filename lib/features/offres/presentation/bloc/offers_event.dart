import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/offers_response_model.dart';
part 'offers_event.freezed.dart';

@freezed
class OffersEvent with _$OffersEvent {
  const factory OffersEvent.get() = _Get;
  const factory OffersEvent.add({
    required FormData formData,
  }) = _Add;
  const factory OffersEvent.delete({
    required int id,
  }) = _Delete;
  const factory OffersEvent.edit({
    required Offer offer,
  }) = _Edit;
  const factory OffersEvent.editImage({
    required int id,
    required FormData formData,
  }) = _EditImage;
}
