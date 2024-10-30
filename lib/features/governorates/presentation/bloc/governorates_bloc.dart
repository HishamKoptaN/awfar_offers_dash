import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/governorates_response_model.dart';
import '../../domain/use_cases/add_governorate_use_case.dart';
import '../../domain/use_cases/delete_governorate_use_case.dart';
import '../../domain/use_cases/get_governorates_use_case.dart';
import 'governorates_event.dart';
import 'governorates_state.dart';

class GovernoratesBloc extends Bloc<GovernoratesEvent, GovernoratesState> {
  final GetGovernoratesUseCase getGovernatesUseCase;
  final AddGovernorateUseCase addGovernorateUseCase;
  final DeleteGovernorateUseCase deleteGovernorateUseCase;
  GovernoratesBloc(
    this.getGovernatesUseCase,
    this.addGovernorateUseCase,
    this.deleteGovernorateUseCase,
  ) : super(
          const GovernoratesState.initial(),
        ) {
    on<GovernoratesEvent>(
      (event, emit) async {
        await event.when(
          getGovernorate: () async {
            emit(
              const GovernoratesState.loading(),
            );
            final result = await getGovernatesUseCase.getGovernorates();
            await result.when(
              success: (response) async {
                GovernoratesResponseModel().loadCategories(response!);
                emit(
                  GovernoratesState.governoratesLoaded(
                    governoratesResponseModel: response,
                  ),
                );
              },
              failure: (error) async {
                emit(
                  GovernoratesState.failure(
                    error: error.error!,
                  ),
                );
              },
            );
          },
          addGovernorate: (addGovernorateRequestModel) async {
            emit(
              const GovernoratesState.loading(),
            );
            final result = await addGovernorateUseCase.addGovernorate(
              addGovernorateRequestModel: addGovernorateRequestModel,
            );
            await result.when(
              success: (governoratesResponseModel) async {
                emit(
                  GovernoratesState.success(
                    governoratesResponseModel: governoratesResponseModel,
                  ),
                );
              },
              failure: (error) async {
                emit(
                  GovernoratesState.failure(
                    error: error.error!,
                  ),
                );
              },
            );
          },
          updateGovernorates: () async {},
          deleteGovernorates: (id) async {
            emit(
              const GovernoratesState.loading(),
            );
            final result = await deleteGovernorateUseCase.deleteCountry(
              id: id,
            );
            await result.when(
              success: (response) async {
                emit(
                  GovernoratesState.success(
                    governoratesResponseModel: response,
                  ),
                );
              },
              failure: (error) async {
                emit(
                  GovernoratesState.failure(
                    error: error.error!,
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
