import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/governoarates_singleton.dart';
import '../../domain/use_cases/add_governorate_use_case.dart';
import '../../domain/use_cases/delete_governorate_use_case.dart';
import '../../domain/use_cases/edit_governorate_use_case.dart';
import '../../domain/use_cases/get_governorates_use_case.dart';
import 'governorates_event.dart';
import 'governorates_state.dart';

class GovernoratesBloc extends Bloc<GovernoratesEvent, GovernoratesState> {
  final GetGovernoratesUseCase getGovernatesUseCase;
  final AddGovernorateUseCase addGovernorateUseCase;
  final EditGovernorateUseCase editGovernorateUseCase;
  final DeleteGovernorateUseCase deleteGovernorateUseCase;
  GovernoratesBloc(
    this.getGovernatesUseCase,
    this.addGovernorateUseCase,
    this.editGovernorateUseCase,
    this.deleteGovernorateUseCase,
  ) : super(
          const GovernoratesState.initial(),
        ) {
    on<GovernoratesEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const GovernoratesState.loading(),
            );
            final result = await getGovernatesUseCase.get();
            await result.when(
              success: (response) async {
                GovernoratesSingleton.instance.governorates = response!;
                emit(
                  const GovernoratesState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  GovernoratesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (
            addGovernorateRequestModel,
          ) async {
            emit(
              const GovernoratesState.loading(),
            );
            final result = await addGovernorateUseCase.add(
              addGovernorateRequestModel: addGovernorateRequestModel,
            );
            await result.when(
              success: (governorate) async {
                GovernoratesSingleton.instance.add(
                  governorate: governorate,
                );
                emit(
                  const GovernoratesState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  GovernoratesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          edit: (
            editGovernorateRequestModel,
          ) async {
            emit(
              const GovernoratesState.loading(),
            );
            final result = await editGovernorateUseCase.edit(
              editGovernorateRequestModel: editGovernorateRequestModel,
            );
            await result.when(
              success: (
                governorate,
              ) async {
                GovernoratesSingleton.instance.replace(
                  governorate: governorate,
                );
                emit(
                  const GovernoratesState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  GovernoratesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          delete: (id) async {
            emit(
              const GovernoratesState.loading(),
            );
            final result = await deleteGovernorateUseCase.delete(
              id: id,
            );
            await result.when(
              success: (response) async {
                GovernoratesSingleton.instance.delete(
                  id: id,
                );
                emit(
                  const GovernoratesState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  GovernoratesState.failure(
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
