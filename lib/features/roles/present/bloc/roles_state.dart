import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/api_error_model.dart';
part 'roles_state.freezed.dart';

@freezed
class RolesState with _$RolesState {
  const factory RolesState.initial() = _Initial;
  const factory RolesState.loaded() = _Loaded;
  const factory RolesState.loading() = _Loading;
  const factory RolesState.success() = _Success;
  const factory RolesState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
