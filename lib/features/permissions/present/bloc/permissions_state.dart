import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/api_error_model.dart';
part 'permissions_state.freezed.dart';

@freezed
class PermissionsState with _$PermissionsState {
  const factory PermissionsState.initial() = _Initial;
  const factory PermissionsState.loaded() = _Loaded;
  const factory PermissionsState.loading() = _Loading;
  const factory PermissionsState.success() = _Success;
  const factory PermissionsState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
