import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/singletons/permissions_singleton.dart';
import '../../domain/use_cases/add_permission_use_case.dart';
import '../../domain/use_cases/edit_permission_use_case.dart';
import '../../domain/use_cases/get_permissions_use_case.dart';
import 'permissions_event.dart';
import 'permissions_state.dart';

class PermissionsBloc extends Bloc<PermissionsEvent, PermissionsState> {
  final GetPermissionsUseCase getPermissionsUseCase;
  final EditPermissionUseCase editPermissionsUseCase;
  final AddPermissionUseCase addPermissionUseCase;
  PermissionsBloc({
    required this.getPermissionsUseCase,
    required this.editPermissionsUseCase,
    required this.addPermissionUseCase,
  }) : super(
          const PermissionsState.initial(),
        ) {
    on<PermissionsEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const PermissionsState.loading(),
            );
            final result = await getPermissionsUseCase.get();
            await result.when(
              success: (response) async {
                PermissionsSingleton.instance.permissions = response;
                emit(
                  const PermissionsState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  PermissionsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          edit: (permission) async {
            emit(
              const PermissionsState.loading(),
            );
            final result = await editPermissionsUseCase.edit(
              permission: permission,
            );
            await result.when(
              success: (
                country,
              ) async {
                emit(
                  const PermissionsState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  PermissionsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (permission) async {
            emit(
              const PermissionsState.loading(),
            );
            final result = await addPermissionUseCase.add(
              permission: permission,
            );
            await result.when(
              success: (
                country,
              ) async {
                emit(
                  const PermissionsState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  PermissionsState.failure(
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
