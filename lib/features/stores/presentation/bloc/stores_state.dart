import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/api_error_model.dart';
import '../../data/models/stores_response_model.dart';
part 'stores_state.freezed.dart';

@freezed
class StoresState with _$StoresState {
  const factory StoresState.initial() = _Initial;
  const factory StoresState.storesLoaded({
    required List<Store>? stores,
  }) = _StoresLoaded;
  const factory StoresState.loading() = _Loading;
  const factory StoresState.success() = _Success;
  const factory StoresState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
