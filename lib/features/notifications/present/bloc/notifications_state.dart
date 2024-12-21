import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = _Initial;
  const factory NotificationsState.loaded() = _Loaded;
  const factory NotificationsState.loading() = _Loading;
  const factory NotificationsState.success() = _Success;
  const factory NotificationsState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
