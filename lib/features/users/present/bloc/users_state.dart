import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loaded() = _Loaded;
  const factory UsersState.loading() = _Loading;
  const factory UsersState.success() = _Success;
  const factory UsersState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
