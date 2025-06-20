import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/stores_singleton.dart';
import '../../domain/use_cases/add_store_use_case.dart';
import '../../domain/use_cases/delete_store_use_case.dart';
import '../../domain/use_cases/edit_store_use_case.dart';
import '../../domain/use_cases/get_stores_use_case.dart';
import 'stores_event.dart';
import 'stores_state.dart';

class StoresBloc extends Bloc<StoresEvent, StoresState> {
  final GetStoresUseCase getUseCase;
  final AddStoreUseCase addUseCase;
  final EditStoreUseCase editUseCase;
  final DeleteStoreUseCase deleteUseCase;
  StoresBloc(
    this.getUseCase,
    this.addUseCase,
    this.editUseCase,
    this.deleteUseCase,
  ) : super(
          const StoresState.initial(),
        ) {
    on<StoresEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            final result = await getUseCase.get();
            await result.when(
              success: (stores) async {
                StoresSingleton.instance.stores = stores;
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
          add: (formData) async {
            emit(
              const StoresState.loading(),
            );
            final result = await addUseCase.add(
              formData: formData,
            );
            await result.when(
              success: (
                store,
              ) async {
                StoresSingleton.instance.add(
                  store: store,
                );
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
          edit: (
            id,
            formData,
          ) async {
            emit(
              const StoresState.loading(),
            );
            final result = await editUseCase.edit(
              id: id,
              formData: formData,
            );
            await result.when(
              success: (
                store,
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
          delete: (
            id,
          ) async {
            emit(
              const StoresState.loading(),
            );
            final result = await deleteUseCase.delete(
              id: id,
            );
            await result.when(
              success: (_) async {
                StoresSingleton.instance.stores.removeWhere(
                  (coupon) => coupon.id == id,
                );
                emit(
                  const StoresState.success(),
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
        );
      },
    );
  }
}
