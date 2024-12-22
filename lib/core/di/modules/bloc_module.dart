import '../../../features/auth/login/present/bloc/login_bloc.dart';
import '../../../features/categories/presentation/bloc/categories_bloc.dart';
import '../../../features/cities/present/bloc/cities_bloc.dart';
import '../../../features/countries/presentation/bloc/countries_bloc.dart';
import '../../../features/external_notifications/present/bloc/external_notifications_bloc.dart';
import '../../../features/main/present/bloc/main_bloc.dart';
import '../../../features/notifications/present/bloc/notifications_bloc.dart';
import '../../../features/offer_groups/presentation/bloc/offer_groups_bloc.dart';
import '../../../features/offers/presentation/bloc/offers_bloc.dart';
import '../../../features/products/presentation/bloc/products_bloc.dart';
import '../../../features/roles/present/bloc/roles_bloc.dart';
import '../../../features/stores/present/bloc/stores_bloc.dart';
import '../../../features/sub_categories/presentation/bloc/sub_categories_bloc.dart';
import '../../../features/coupons/presentation/bloc/coupons_bloc.dart';
import '../../../features/sub_categories_items/presentation/bloc/markas_bloc.dart';
import '../../../features/users/present/bloc/users_bloc.dart';
import '../dependency_injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      //! Main
      ..registerLazySingleton<MainBloc>(
        () => MainBloc(
          getIt(),
        ),
      )
      //! Login
      ..registerLazySingleton<LoginBloc>(
        () => LoginBloc(
          getIt(),
        ),
      )
      //! Countries
      ..registerLazySingleton<CountriesBloc>(
        () => CountriesBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
      )
      //! Cities
      ..registerLazySingleton<CitiesBloc>(
        () => CitiesBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
      )
      //! Stores
      ..registerLazySingleton<StoresBloc>(
        () => StoresBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
      )
      //! OfferGroups
      ..registerLazySingleton<OfferGroupsBloc>(
        () => OfferGroupsBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
      )
      //! Categories
      ..registerLazySingleton<CategoriesBloc>(
        () => CategoriesBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
      )
      //! SubCategories
      ..registerLazySingleton<SubCategoriesBloc>(
        () => SubCategoriesBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
      )
      //! SubCategoriesItems
      ..registerLazySingleton<MarkasBloc>(
        () => MarkasBloc(
          getMarkasUseCase: getIt(),
          addMarkaUseCase: getIt(),
          editUseCase: getIt(),
          deleteUseCase: getIt(),
        ),
      )
      //! Offers
      ..registerLazySingleton<OffersBloc>(
        () => OffersBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
      )
      //! Products
      ..registerLazySingleton<ProductsBloc>(
        () => ProductsBloc(
          getProductsUseCase: getIt(),
          addProductsUseCase: getIt(),
          editUseCase: getIt(),
          deleteUseCase: getIt(),
        ),
      )
      //! Coupons
      ..registerLazySingleton<CouponsBloc>(
        () => CouponsBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
      )
      //! Notifications
      ..registerLazySingleton<NotificationsBloc>(
        () => NotificationsBloc(
          getNotificationsUseCase: getIt(),
          editNotificationsUseCase: getIt(),
          addNotificationUseCase: getIt(),
          deleteNotificationUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<ExternalNotificationsBloc>(
        () => ExternalNotificationsBloc(
          addExternalNotificationUseCase: getIt(),
        ),
      )
      //! Users
      ..registerLazySingleton<UsersBloc>(
        () => UsersBloc(
          getUsersUseCase: getIt(),
          editUsersUseCase: getIt(),
          addUserUseCase: getIt(),
          notifyUseCase: getIt(),
        ),
      )
      //! Roles
      ..registerLazySingleton<RolesBloc>(
        () => RolesBloc(
          getRolesUseCase: getIt(),
          editRolesUseCase: getIt(),
          addRoleUseCase: getIt(),
        ),
      );
  }
}
