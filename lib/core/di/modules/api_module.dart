import '../../../features/auth/login/data/data_sources/login_api.dart';
import '../../../features/external_notifications/data/data_sources/external_notifications_api.dart';
import '../../../features/governorates/data/data_sources/governorates_api.dart';
import '../../../features/coupons/data/data_sources/coupons_api.dart';
import '../../../features/notifications/data/data_sources/notifications_api.dart';
import '../../../features/offer_groups/data/data_sources/offer_groups_api.dart';
import '../../../features/products/data/data_sources/products_api.dart';
import '../../../features/sub_categories_items/data/data_sources/markas_api.dart';
import '../../../features/users/data/data_sources/users_api.dart';
import '../../networking/dio_factory.dart';
import '../dependency_injection.dart';
import '../../../features/categories/data/data_sources/categories_api.dart';
import '../../../features/countries/data/data_sources/countries_api.dart';
import '../../../features/main/data/datasources/main_api.dart';
import '../../../features/stores/data/data_sources/stores_api.dart';
import '../../../features/offers/data/data_sources/offers_api.dart';
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
      //! Login
      ..registerLazySingleton<LoginApi>(
        () => LoginApi(
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
      //! OffersGroups
      ..registerLazySingleton<OfferGroupsApi>(
        () => OfferGroupsApi(
          getIt(),
        ),
      )
      //! Offers
      ..registerLazySingleton<OffersApi>(
        () => OffersApi(
          getIt(),
        ),
      )
      //! Products
      ..registerLazySingleton<ProductsApi>(
        () => ProductsApi(
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
      ) //! Markas
      ..registerLazySingleton<MarkasApi>(
        () => MarkasApi(
          getIt(),
        ),
      )
      //! Coupons
      ..registerLazySingleton<CouponsApi>(
        () => CouponsApi(
          getIt(),
        ),
      )
      //! Notification
      ..registerLazySingleton<NotificationsApi>(
        () => NotificationsApi(
          getIt(),
        ),
      )
      //! External Notification
      ..registerLazySingleton<ExternalNotificationsApi>(
        () => ExternalNotificationsApi(
          getIt(),
        ),
      )
      //! Users
      ..registerLazySingleton<UsersApi>(
        () => UsersApi(
          getIt(),
        ),
      );
  }
}
