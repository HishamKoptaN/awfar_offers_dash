import '../../../features/categories/domain/use_cases/add_category_use_case.dart';
import '../../../features/categories/domain/use_cases/get_categories_use_case.dart';
import '../../../features/countries/domain/use_cases/add_country_use_case.dart';
import '../../../features/countries/domain/use_cases/delete_country_use_case.dart';
import '../../../features/countries/domain/use_cases/get_countries_use_case.dart';
import '../../../features/governorates/domain/use_cases/add_governorate_use_case.dart';
import '../../../features/governorates/domain/use_cases/delete_governorate_use_case.dart';
import '../../../features/governorates/domain/use_cases/get_governorates_use_case.dart';
import '../../../features/main/domain/usecases/check_use_case.dart';
import '../../../features/offres/domain/use_cases/add_offer_use_case.dart';
import '../../../features/offres/domain/use_cases/get_offres_use_case.dart';
import '../../../features/stores/domain/use_cases/get_stores_use_case.dart';
import '../dependency_injection.dart';

class UseCaseModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<CheckUseCase>(
        () => CheckUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton<GetCountrieUseCase>(
        () => GetCountrieUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton<AddCountryUseCase>(
        () => AddCountryUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton<DeleteCountryUseCase>(
        () => DeleteCountryUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton<GetGovernoratesUseCase>(
        () => GetGovernoratesUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton<AddGovernorateUseCase>(
        () => AddGovernorateUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton<DeleteGovernorateUseCase>(
        () => DeleteGovernorateUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton<GetStoresUseCase>(
        () => GetStoresUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton<AddCategoryUseCase>(
        () => AddCategoryUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton<GetOffersUseCase>(
        () => GetOffersUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton<AddOfferUseCase>(
        () => AddOfferUseCase(
          getIt(),
        ),
      );
  }
}
