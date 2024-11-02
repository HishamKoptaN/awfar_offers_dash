import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/stores_response_model.dart';
import '../../domain/use_cases/add_store_use_case.dart';
import '../../domain/use_cases/get_stores_use_case.dart';
import 'stores_event.dart';
import 'stores_state.dart';

class StoresBloc extends Bloc<StoresEvent, StoresState> {
  final GetStoresUseCase getStoresUseCase;
  final AddStoreUseCase addStoreUseCase;
  StoresBloc(
    this.getStoresUseCase,
    this.addStoreUseCase,
  ) : super(
          const StoresState.initial(),
        ) {
    on<StoresEvent>(
      (event, emit) async {
        await event.when(
          getEvent: () async {
            final result = await getStoresUseCase.getStores();
            await result.when(
              success: (stores) async {
                await StoresResponseModel().loadstores(
                  stores: stores,
                );
                emit(
                  StoresState.storesLoaded(
                    stores: stores,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  StoresState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          addEvent: (formData) async {
            emit(
              const StoresState.loading(),
            );
            final result = await addStoreUseCase.addStore(
              formData: formData,
            );
            await result.when(
              success: (
                response,
              ) async {
                emit(
                  const StoresState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  StoresState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          updateEvent: () {},
          deleteEvent: () {},
        );
      },
    );
  }
}
