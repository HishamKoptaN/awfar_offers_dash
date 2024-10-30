import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/models/check_response_model.dart';
part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial() = _Initial;
  const factory MainState.loading() = _LoadInProgress;
  const factory MainState.logedIn() = _LogedIn;
  const factory MainState.logedOut() = _LogedOut;
  const factory MainState.notVerify({
    required User user,
  }) = _NotVerify;
  const factory MainState.verified() = _Verified;
  const factory MainState.error({
    required ApiErrorModel apiErrorModel,
  }) = _Error;
}
