import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/roles_singleton.dart';
import '../../../../core/singletons/user_roles_singletone.dart';
import '../../domain/use_cases/add_role_use_case.dart';
import '../../domain/use_cases/edit_role_use_case.dart';
import '../../domain/use_cases/get_roles_use_case.dart';
import 'roles_event.dart';
import 'roles_state.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  final GetRolesUseCase getRolesUseCase;
  final EditRoleUseCase editRolesUseCase;
  final AddRoleUseCase addRoleUseCase;
  RolesBloc({
    required this.getRolesUseCase,
    required this.editRolesUseCase,
    required this.addRoleUseCase,
  }) : super(
          const RolesState.initial(),
        ) {
    on<RolesEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const RolesState.loading(),
            );
            final result = await getRolesUseCase.get();
            await result.when(
              success: (response) async {
                UserRolesSingleton.instance.userRoles = response.userRoles!;
                RolesSingleton.instance.roles = response.roles!;
                emit(
                  const RolesState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  RolesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          edit: (role) async {
            emit(
              const RolesState.loading(),
            );
            final result = await editRolesUseCase.edit(
              role: role,
            );
            await result.when(
              success: (
                response,
              ) async {
                RolesSingleton.instance.replace(
                  role: response!,
                );
                emit(
                  const RolesState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  RolesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (role) async {
            emit(
              const RolesState.loading(),
            );
            final result = await addRoleUseCase.add(
              role: role,
            );
            await result.when(
              success: (
                response,
              ) async {
                RolesSingleton.instance.add(
                  role: response!,
                );
                emit(
                  const RolesState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  RolesState.failure(
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
