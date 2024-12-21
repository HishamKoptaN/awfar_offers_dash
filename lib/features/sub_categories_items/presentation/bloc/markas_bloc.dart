import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/markas_singleton.dart';
import '../../domain/use_cases/add_marka_use_case.dart';
import '../../domain/use_cases/delete_marka_use_case.dart';
import '../../domain/use_cases/edit_marka_use_case.dart';
import '../../domain/use_cases/get_markas_items_use_case.dart';
import 'markas_event.dart';
import 'markas_state.dart';

class MarkasBloc extends Bloc<MarkasEvent, MarkasState> {
  final GetMarkasUseCase getMarkasUseCase;
  final AddMarkaUseCase addMarkaUseCase;
  final EditMarkaUseCase editUseCase;
  final DeleteMarkaUseCase deleteUseCase;

  MarkasBloc({
    required this.getMarkasUseCase,
    required this.addMarkaUseCase,
    required this.editUseCase,
    required this.deleteUseCase,
  }) : super(
          const MarkasState.initial(),
        ) {
    on<MarkasEvent>(
      (event, emit) async {
        await event.when(
          get: (id) async {
            emit(
              const MarkasState.loading(),
            );
            final result = await getMarkasUseCase.get(
              id: id,
            );
            await result.when(
              success: (response) async {
                MarkasSingleton.instance.markas = response;
                emit(
                  const MarkasState.loaded(),
                );
              },
              failure: (error) async {
                emit(
                  MarkasState.failure(
                    error: error.error!,
                  ),
                );
              },
            );
          },
          add: (addMarkaReqBodyModel) async {
            emit(
              const MarkasState.loading(),
            );
            final result = await addMarkaUseCase.add(
              addMarkaReqBodyModel: addMarkaReqBodyModel,
            );
            await result.when(
              success: (response) async {
                MarkasSingleton.instance.add(
                  marka: response,
                );
                emit(
                  const MarkasState.success(),
                );
                emit(
                  const MarkasState.loaded(),
                );
              },
              failure: (error) async {
                emit(
                  MarkasState.failure(
                    error: error.error!,
                  ),
                );
              },
            );
          },
          edit: (
            marka,
          ) async {
            emit(
              const MarkasState.loading(),
            );
            final result = await editUseCase.edit(
              marka: marka,
            );
            await result.when(
              success: (
                marka,
              ) async {
                MarkasSingleton.instance.replace(
                  marka: marka,
                );
                emit(
                  const MarkasState.success(),
                );
                emit(
                  const MarkasState.loaded(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  MarkasState.failure(
                    error: apiErrorModel.error!,
                  ),
                );
                emit(
                  const MarkasState.loaded(),
                );
              },
            );
          },
          delete: (
            id,
          ) async {
            emit(
              const MarkasState.loading(),
            );
            final result = await deleteUseCase.delete(
              id: id,
            );
            await result.when(
              success: (_) async {
                MarkasSingleton.instance.delete(
                  id: id,
                );
                emit(
                  const MarkasState.success(),
                );
                emit(
                  const MarkasState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  MarkasState.failure(
                    error: apiErrorModel.error!,
                  ),
                );
                emit(
                  const MarkasState.loaded(),
                );
              },
            );
          },
        );
      },
    );
  }
}
