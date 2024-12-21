import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/countries_singleton.dart';
import '../../domain/use_cases/add_country_use_case.dart';
import '../../domain/use_cases/delete_country_use_case.dart';
import '../../domain/use_cases/edit_country_use_case.dart';
import '../../domain/use_cases/get_countries_use_case.dart';
import 'countries_event.dart';
import 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final GetCountriesUseCase getCountrieUseCase;
  final AddCountryUseCase addCountryUseCase;
  final DeleteCountryUseCase deleteCountryUseCase;
  final EditCountryUseCase editCountryUseCase;

  CountriesBloc(
    this.getCountrieUseCase,
    this.addCountryUseCase,
    this.editCountryUseCase,
    this.deleteCountryUseCase,
  ) : super(
          const CountriesState.initial(),
        ) {
    on<CountriesEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const CountriesState.loading(),
            );
            final result = await getCountrieUseCase.get();
            await result.when(
              success: (response) async {
                CountriesSingleton.instance.countries = response!;
                emit(
                  const CountriesState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CountriesState.failure(
                    error: apiErrorModel.error!,
                  ),
                );
              },
            );
          },
          add: (addCountryRequestBodyModel) async {
            emit(
              const CountriesState.loading(),
            );
            final result = await addCountryUseCase.add(
              addCountryRequestBodyModel: addCountryRequestBodyModel,
            );
            await result.when(
              success: (
                country,
              ) async {
                CountriesSingleton.instance.add(
                  country: country,
                );
                emit(
                  const CountriesState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  CountriesState.failure(
                    error: apiErrorModel.error!,
                  ),
                );
              },
            );
          },
          edit: (editCountryRequestBodyModel) async {
            emit(
              const CountriesState.loading(),
            );
            final result = await editCountryUseCase.edit(
              editCountryRequestBodyModel: editCountryRequestBodyModel,
            );
            await result.when(
              success: (
                country,
              ) async {
                CountriesSingleton.instance.replace(
                  country: country,
                );

                emit(
                  const CountriesState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  CountriesState.failure(
                    error: apiErrorModel.error!,
                  ),
                );
              },
            );
          },
          delete: (id) async {
            emit(
              const CountriesState.loading(),
            );
            final result = await deleteCountryUseCase.delete(
              id: id,
            );
            await result.when(
              success: (
                response,
              ) async {
                CountriesSingleton.instance.delete(
                  id: id,
                );
                emit(
                  const CountriesState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  CountriesState.failure(
                    error: apiErrorModel.error!,
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
