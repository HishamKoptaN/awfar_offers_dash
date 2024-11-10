import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
part 'coupons_state.freezed.dart';

@freezed
class CouponsState with _$CouponsState {
  const factory CouponsState.initial() = _Initial;
  const factory CouponsState.loading() = _Loading;
  const factory CouponsState.success() = _Success;
  const factory CouponsState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Error;
}
