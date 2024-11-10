import '../../../features/governorates/data/data_sources/governorates_api.dart';
import '../../../features/coupons/data/data_sources/coupons_api.dart';
import '../../networking/dio_factory.dart';
import '../dependency_injection.dart';
import '../../../features/categories/data/data_sources/categories_api.dart';
import '../../../features/countries/data/data_sources/countries_api.dart';
import '../../../features/main/data/datasources/main_api.dart';
import '../../../features/stores/data/data_sources/stores_api.dart';
import '../../../features/offres/data/data_sources/offers_api.dart';
import '../../../features/sub_categories/data/data_sources/sub_categories_api.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    final dio = await DioFactory.setupDio();
    getIt
      //! Dio
      ..registerSingleton(
        dio,
      )
      //! Main
      ..registerLazySingleton<MainApi>(
        () => MainApi(
          getIt(),
        ),
      )
      //! Countries
      ..registerLazySingleton<CountriesApi>(
        () => CountriesApi(
          getIt(),
        ),
      )
      //! Governorates
      ..registerLazySingleton<GovernoratesApi>(
        () => GovernoratesApi(
          getIt(),
        ),
      )
      //! Stores
      ..registerLazySingleton<StoresApi>(
        () => StoresApi(
          getIt(),
        ),
      )
      //! Categories
      ..registerLazySingleton<CategoriesApi>(
        () => CategoriesApi(
          getIt(),
        ),
      )
      //! SubCategories
      ..registerLazySingleton<SubCategoriesApi>(
        () => SubCategoriesApi(
          getIt(),
        ),
      )
      //! Offers
      ..registerLazySingleton<OffersApi>(
        () => OffersApi(
          getIt(),
        ),
      )
      //! Coupons
      ..registerLazySingleton<CouponsApi>(
        () => CouponsApi(
          getIt(),
        ),
      );
  }
}
