import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/api_error_model.dart';
part 'offer_groups_state.freezed.dart';

@freezed
class OfferGroupsState with _$OfferGroupsState {
  const factory OfferGroupsState.initial() = _Initial;
  const factory OfferGroupsState.loaded() = _OfferGroupsLoaded;
  const factory OfferGroupsState.loading() = _Loading;
  const factory OfferGroupsState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
  const factory OfferGroupsState.success() = _Success;
}
