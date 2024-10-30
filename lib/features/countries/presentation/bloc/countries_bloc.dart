import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/models/countries_response_model.dart';
import '../../domain/use_cases/add_country_use_case.dart';
import '../../domain/use_cases/delete_country_use_case.dart';
import '../../domain/use_cases/get_countries_use_case.dart';
import 'countries_event.dart';
import 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final GetCountrieUseCase getCountrieUseCase;
  final AddCountryUseCase addCountryUseCase;
  final DeleteCountryUseCase deleteCountryUseCase;

  CountriesBloc(
    this.getCountrieUseCase,
    this.addCountryUseCase,
    this.deleteCountryUseCase,
  ) : super(
          const CountriesState.initial(),
        ) {
    on<CountriesEvent>(
      (event, emit) async {
        await event.when(
          getCountries: () async {
            final result = await getCountrieUseCase.getCountries();
            await result.when(
              success: (response) async {
                await CountriesResponseModel().loadCountries(
                  response!,
                );
                emit(
                  CountriesState.countriesLoaded(
                    countriesResponseModel: response,
                  ),
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
          addCountryEvent: (addCountryRequestModel) async {
            final result = await addCountryUseCase.addCountry(
              addCountryRequestModel: addCountryRequestModel,
            );
            await result.when(
              success: (
                response,
              ) async {
                emit(
                  CountriesState.success(
                    countriesResponseModel: response,
                  ),
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
          updateCountries: () {},
          deleteCountries: (id) async {
            final result = await deleteCountryUseCase.deleteCountry(
              id: id,
            );
            await result.when(
              success: (
                response,
              ) async {
                emit(
                  CountriesState.success(
                    countriesResponseModel: response,
                  ),
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
