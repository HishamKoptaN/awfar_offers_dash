import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/users_singletone.dart';
import '../../domain/use_cases/edit_user_use_case.dart';
import '../../domain/use_cases/get_users_use_case.dart';
import '../../domain/use_cases/notify_use_case.dart';
import 'users_event.dart';
import 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUseCase getUsersUseCase;
  final NotifyUseCase notifyUseCase;
  final EditUserUseCase editUsersUseCase;
  final GetUsersUseCase addUserUseCase;
  UsersBloc({
    required this.getUsersUseCase,
    required this.notifyUseCase,
    required this.editUsersUseCase,
    required this.addUserUseCase,
  }) : super(
          const UsersState.initial(),
        ) {
    on<UsersEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const UsersState.loading(),
            );
            final result = await getUsersUseCase.get();
            await result.when(
              success: (response) async {
                UsersSingleton.instance.users = response;

                emit(
                  const UsersState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  UsersState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          notify: (
            notifyReq,
          ) async {
            emit(
              const UsersState.loading(),
            );
            final result = await notifyUseCase.notify(
              notifyReq: notifyReq,
            );
            await result.when(
              success: (
                country,
              ) async {
                emit(
                  const UsersState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  UsersState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          edit: (user) async {
            emit(
              const UsersState.loading(),
            );
            final result = await editUsersUseCase.edit(
              user: user,
            );
            await result.when(
              success: (
                country,
              ) async {
                emit(
                  const UsersState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  UsersState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (user) async {
            // emit(
            //   const UsersState.loading(),
            // );
            // final result = await addUserUseCase.add(
            //   user: user,
            // );
            // await result.when(
            //   success: (
            //     country,
            //   ) async {
            //     emit(
            //       const UsersState.success(),
            //     );
            //   },
            //   failure: (
            //     apiErrorModel,
            //   ) async {
            //     emit(
            //       UsersState.failure(
            //         apiErrorModel: apiErrorModel,
            //       ),
            //     );
            //   },
            // );
          },
        );
      },
    );
  }
}
