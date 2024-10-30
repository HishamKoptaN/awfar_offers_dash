import 'package:awfar_offers_dash/features/governorates/data/data_sources/governorates_api.dart';

import '../../../features/categories/data/data_sources/categories_api.dart';
import '../../../features/countries/data/data_sources/countries_api.dart';
import '../../../features/main/data/datasources/main_api.dart';
import '../../../features/offres/data/data_sources/offers_api.dart';
import '../../../features/stores/data/data_sources/stores_api.dart';
import '../../networking/dio_factory.dart';
import '../dependency_injection.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    final dio = await DioFactory.setupDio();
    getIt
      ..registerSingleton(
        dio,
      )
      ..registerLazySingleton<MainApi>(
        () => MainApi(
          getIt(),
        ),
      )
      ..registerLazySingleton<CountriesApi>(
        () => CountriesApi(
          getIt(),
        ),
      )
      ..registerLazySingleton<GovernoratesApi>(
        () => GovernoratesApi(
          getIt(),
        ),
      )
      ..registerLazySingleton<StoresApi>(
        () => StoresApi(
          getIt(),
        ),
      )
      ..registerLazySingleton<CategoriesApi>(
        () => CategoriesApi(
          getIt(),
        ),
      )
      ..registerLazySingleton<OffersApi>(
        () => OffersApi(
          getIt(),
        ),
      );
  }
}
