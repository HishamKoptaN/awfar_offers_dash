import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/stores_response_model.dart';
import '../../domain/use_cases/get_stores_use_case.dart';
import 'stores_event.dart';
import 'stores_state.dart';

class StoresBloc extends Bloc<StoresEvent, StoresState> {
  final GetStoresUseCase getStoresUseCase;
  StoresBloc(this.getStoresUseCase)
      : super(
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
                  stores,
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
          addEvent: () {},
          updateEvent: () {},
          deleteEvent: () {},
        );
      },
    );
  }
}
