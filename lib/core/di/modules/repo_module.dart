import '../../../features/auth/login/data/repo_imp/login_repo_impl.dart';
import '../../../features/auth/login/domain/repo/login_repo.dart';
import '../../../features/categories/data/repo_impl/categories_repo_impl.dart';
import '../../../features/categories/domain/repo/categories_repo.dart';
import '../../../features/countries/data/repo_impl/countreis_repo_impl.dart';
import '../../../features/countries/domain/repo/countreis_repo.dart';
import '../../../features/external_notifications/data/repo/external_notifications_repo.dart';
import '../../../features/external_notifications/domain/repo_impl/external_notifications_repo_impl.dart';
import '../../../features/governorates/data/repo_impl/governates_repo_impl.dart';
import '../../../features/governorates/domain/repo/governorates_repo.dart';
import '../../../features/main/data/repo_impl/main_repo_impl.dart';
import '../../../features/main/domain/repo/main_repo.dart';
import '../../../features/notifications/data/repo/notifications_repo.dart';
import '../../../features/notifications/domain/repo_impl/notifications_repo_impl.dart';
import '../../../features/offer_groups/data/repo_impl/offer_groups_repo_impl.dart';
import '../../../features/offer_groups/domain/repo/offer_groups_repo.dart';
import '../../../features/offers/data/repo_impl/offres_repo_impl.dart';
import '../../../features/offers/domain/repo/offres_repo.dart';
import '../../../features/products/data/repo_impl/products_repo_impl.dart';
import '../../../features/products/domain/repo/products_repo.dart';
import '../../../features/roles/data/repo/roles_repo.dart';
import '../../../features/roles/domain/repo_impl/roles_repo_impl.dart';
import '../../../features/stores/data/repo_impl/stores_repo_impl.dart';
import '../../../features/stores/domain/repo/stores_repo.dart';
import '../../../features/sub_categories/data/repo_impl/sub_categories_repo_impl.dart';
import '../../../features/sub_categories/domain/repo/sub_categories_repo.dart';
import '../../../features/coupons/data/repo_impl/coupons_repo_impl.dart';
import '../../../features/coupons/domain/repo/coupons_repo.dart';
import '../../../features/sub_categories_items/data/repo_impl/markas_repo_impl.dart';
import '../../../features/sub_categories_items/domain/repo/markas_repo.dart';
import '../../../features/users/data/repo/users_repo.dart';
import '../../../features/users/domain/repo_impl/users_repo_impl.dart';
import '../dependency_injection.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      //! Main
      ..registerLazySingleton<MainRepo>(
        () => MainRepoImpl(
          getIt(),
        ),
      )
      //! Login
      ..registerLazySingleton<LoginRepo>(
        () => LoginRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<LoginRepoImpl>(
        () => LoginRepoImpl(
          getIt(),
        ),
      )
      //! Countries
      ..registerLazySingleton<CountriesRepo>(
        () => CountriesRepoImpl(
          getIt(),
        ),
      )
      //! Governorates
      ..registerLazySingleton<GovernoratesRepo>(
        () => GovernoratesRepoImpl(
          getIt(),
        ),
      )
      //! Stores
      ..registerLazySingleton<StoresRepo>(
        () => StoresRepoImpl(
          getIt(),
        ),
      )
      //! OfferGroups
      ..registerLazySingleton<OfferGroupsRepo>(
        () => OfferGroupsRepoImpl(
          getIt(),
        ),
      )
      //! Products
      ..registerLazySingleton<ProductsRepo>(
        () => ProductsRepoImpl(
          getIt(),
        ),
      )
      //! Categories
      ..registerLazySingleton<CategoriesRepo>(
        () => CategoriesRepoImpl(
          getIt(),
        ),
      )
      //! SubCategories
      ..registerLazySingleton<SubCategoriesRepo>(
        () => SubCategoriesRepoImpl(
          getIt(),
        ),
      ) //! Marka
      ..registerLazySingleton<MarkasRepo>(
        () => MarkasRepoImpl(
          markasApi: getIt(),
        ),
      )
      //! Offers
      ..registerLazySingleton<OffersRepo>(
        () => OffersRepoImpl(
          getIt(),
        ),
      )
      //! Coupons
      ..registerLazySingleton<CouponsRepo>(
        () => CouponsRepoImpl(
          getIt(),
        ),
      )
      //! Notifications
      ..registerLazySingleton<NotificationsRepo>(
        () => NotificationsRepoImpl(
          getIt(),
        ),
      )
      //! External Notifications
      ..registerLazySingleton<ExternalNotificationsRepo>(
        () => ExternalNotificationsRepoImpl(
          externalNotificationsApi: getIt(),
        ),
      )
      //! Users
      ..registerLazySingleton<UsersRepo>(
        () => UsersRepoImpl(
          getIt(),
        ),
      )
      //! Roles
      ..registerLazySingleton<RolesRepo>(
        () => RolesRepoImpl(
          getIt(),
        ),
      );
  }
}
