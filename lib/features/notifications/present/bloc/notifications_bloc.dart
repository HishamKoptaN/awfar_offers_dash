import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/notifications_singleton.dart';
import '../../domain/use_cases/add_notification_use_case.dart';
import '../../domain/use_cases/delete_notification_use_case.dart';
import '../../domain/use_cases/edit_notification_use_case.dart';
import '../../domain/use_cases/get_notifications_use_case.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetNotificationsUseCase getNotificationsUseCase;
  final EditNotificationUseCase editNotificationsUseCase;
  final AddNotificationUseCase addNotificationUseCase;
  final DeleteNotificationUseCase deleteNotificationUseCase;

  NotificationsBloc({
    required this.getNotificationsUseCase,
    required this.editNotificationsUseCase,
    required this.addNotificationUseCase,
    required this.deleteNotificationUseCase,
  }) : super(
          const NotificationsState.initial(),
        ) {
    on<NotificationsEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const NotificationsState.loading(),
            );
            final result = await getNotificationsUseCase.get();
            await result.when(
              success: (response) async {
                NotificationsSingleton.instance.notifications = response;
                emit(
                  const NotificationsState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  NotificationsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          edit: (message) async {
            emit(
              const NotificationsState.loading(),
            );
            final result = await editNotificationsUseCase.edit(
              message: message,
            );
            await result.when(
              success: (
                notification,
              ) async {
                NotificationsSingleton.instance.replace(
                  notification: notification,
                );
                await Future.delayed(const Duration(milliseconds: 200));
                emit(
                  const NotificationsState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  NotificationsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (notification) async {
            emit(
              const NotificationsState.loading(),
            );
            final result = await addNotificationUseCase.add(
              notification: notification,
            );
            await result.when(
              success: (
                notification,
              ) async {
                NotificationsSingleton.instance.add(
                  notification: notification,
                );
                emit(
                  const NotificationsState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  NotificationsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          delete: (id) async {
            final result = await deleteNotificationUseCase.delete(
              id: id,
            );
            await result.when(
              success: (
                notification,
              ) async {
                NotificationsSingleton.instance.delete(
                  id: id,
                );
                emit(
                  const NotificationsState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  NotificationsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          refersh: () async {
            emit(
              const NotificationsState.loaded(),
            );
          },
        );
      },
    );
  }
}
