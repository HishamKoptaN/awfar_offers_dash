import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/cities_singleton.dart';
import '../../domain/use_cases/add_city_use_case.dart';
import '../../domain/use_cases/delete_city_use_case.dart';
import '../../domain/use_cases/edit_city_use_case.dart';
import '../../domain/use_cases/get_cities_use_case.dart';
import 'cities_event.dart';
import 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final GetCitiesUseCase getGovernatesUseCase;
  final AddCityUseCase addCityUseCase;
  final EditCityUseCase editCityUseCase;
  final DeleteCityUseCase deleteCityUseCase;
  CitiesBloc(
    this.getGovernatesUseCase,
    this.addCityUseCase,
    this.editCityUseCase,
    this.deleteCityUseCase,
  ) : super(
          const CitiesState.initial(),
        ) {
    on<CitiesEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const CitiesState.loading(),
            );
            final result = await getGovernatesUseCase.get();
            await result.when(
              success: (response) async {
                CitiesSingleton.instance.cities = response!;
                emit(
                  const CitiesState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CitiesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (
            addCityReqModel,
          ) async {
            emit(
              const CitiesState.loading(),
            );
            final result = await addCityUseCase.add(
              addCityReqModel: addCityReqModel,
            );
            await result.when(
              success: (governorate) async {
                CitiesSingleton.instance.add(
                  governorate: governorate,
                );
                emit(
                  const CitiesState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CitiesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          edit: (
            editCityReqModel,
          ) async {
            emit(
              const CitiesState.loading(),
            );
            final result = await editCityUseCase.edit(
              editCityReqModel: editCityReqModel,
            );
            await result.when(
              success: (
                governorate,
              ) async {
                CitiesSingleton.instance.replace(
                  governorate: governorate,
                );
                emit(
                  const CitiesState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  CitiesState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          delete: (id) async {
            emit(
              const CitiesState.loading(),
            );
            final result = await deleteCityUseCase.delete(
              id: id,
            );
            await result.when(
              success: (response) async {
                CitiesSingleton.instance.delete(
                  id: id,
                );
                emit(
                  const CitiesState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CitiesState.failure(
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
