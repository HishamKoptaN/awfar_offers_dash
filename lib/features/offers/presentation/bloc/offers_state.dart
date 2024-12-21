import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/models/offer.dart';
part 'offers_state.freezed.dart';

@freezed
class OffersState with _$OffersState {
  const factory OffersState.initial() = _Initial;
  const factory OffersState.offersLoaded({
    required List<Offer>? offers,
  }) = _OffersLoaded;
  const factory OffersState.loading() = _Loading;
  const factory OffersState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
  const factory OffersState.success() = _Success;
}
