import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../domain/use_cases/add_external_notification_use_case.dart';
import 'external_notifications_event.dart';
import 'external_notifications_state.dart';

class ExternalNotificationsBloc
    extends Bloc<ExternalNotificationsEvent, ExternalNotificationsState> {
  final AddExternalNotificationUseCase addExternalNotificationUseCase;

  ExternalNotificationsBloc({
    required this.addExternalNotificationUseCase,
  }) : super(
          const ExternalNotificationsState.initial(),
        ) {
    on<ExternalNotificationsEvent>(
      (
        event,
        emit,
      ) async {
        await event.when(
          add: (notification) async {
            emit(
              const ExternalNotificationsState.loading(),
            );
            final result = await addExternalNotificationUseCase.add(
              externalNotification: notification,
            );
            await result.when(
              success: (notification) async {
                emit(
                  const ExternalNotificationsState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  ExternalNotificationsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
