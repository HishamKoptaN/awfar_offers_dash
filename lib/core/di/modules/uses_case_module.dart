import 'package:awfar_offers_dash/features/users/domain/use_cases/add_user_use_case.dart';
import 'package:awfar_offers_dash/features/users/domain/use_cases/notify_use_case.dart';

import '../../../features/auth/login/domain/use_cases/login_use_case.dart';
import '../../../features/categories/domain/use_cases/add_category_use_case.dart';
import '../../../features/categories/domain/use_cases/delete_category_use_case.dart';
import '../../../features/categories/domain/use_cases/edit_category_use_case.dart';
import '../../../features/categories/domain/use_cases/get_categories_use_case.dart';
import '../../../features/countries/domain/use_cases/add_country_use_case.dart';
import '../../../features/countries/domain/use_cases/delete_country_use_case.dart';
import '../../../features/countries/domain/use_cases/edit_country_use_case.dart';
import '../../../features/countries/domain/use_cases/get_countries_use_case.dart';
import '../../../features/coupons/domain/use_cases/add_coupon_use_case.dart';
import '../../../features/coupons/domain/use_cases/delete_coupon_use_case.dart';
import '../../../features/coupons/domain/use_cases/update_coupon_use_case.dart';
import '../../../features/external_notifications/domain/use_cases/add_external_notification_use_case.dart';
import '../../../features/governorates/domain/use_cases/add_governorate_use_case.dart';
import '../../../features/governorates/domain/use_cases/delete_governorate_use_case.dart';
import '../../../features/governorates/domain/use_cases/edit_governorate_use_case.dart';
import '../../../features/governorates/domain/use_cases/get_governorates_use_case.dart';
import '../../../features/main/domain/usecases/check_use_case.dart';
import '../../../features/notifications/domain/use_cases/add_notification_use_case.dart';
import '../../../features/notifications/domain/use_cases/delete_notification_use_case.dart';
import '../../../features/notifications/domain/use_cases/edit_notification_use_case.dart';
import '../../../features/notifications/domain/use_cases/get_notifications_use_case.dart';
import '../../../features/offer_groups/domain/use_cases/add_offer_group_use_case.dart';
import '../../../features/offer_groups/domain/use_cases/delete_offer_group_use_case.dart';
import '../../../features/offer_groups/domain/use_cases/edit_offer_group_use_case.dart';
import '../../../features/offer_groups/domain/use_cases/get_offer_groups_use_case.dart';
import '../../../features/offers/domain/use_cases/add_offer_use_case.dart';
import '../../../features/offers/domain/use_cases/delete_offer_use_case.dart';
import '../../../features/offers/domain/use_cases/edit_offer_image_use_case.dart';
import '../../../features/offers/domain/use_cases/edit_offer_use_case.dart';
import '../../../features/offers/domain/use_cases/get_offres_use_case.dart';
import '../../../features/products/domain/use_cases/add_product_use_case.dart';
import '../../../features/products/domain/use_cases/delete_product_use_case.dart';
import '../../../features/products/domain/use_cases/edit_product_use_case.dart';
import '../../../features/products/domain/use_cases/get_products_use_case.dart';
import '../../../features/stores/domain/use_cases/add_store_use_case.dart';
import '../../../features/stores/domain/use_cases/delete_store_use_case.dart';
import '../../../features/stores/domain/use_cases/edit_store_use_case.dart';
import '../../../features/stores/domain/use_cases/get_stores_use_case.dart';
import '../../../features/sub_categories/domain/use_cases/add_sub_category_use_case.dart';
import '../../../features/sub_categories/domain/use_cases/delete_sub_category_use_case.dart';
import '../../../features/sub_categories/domain/use_cases/edit_sub_category_use_case.dart';
import '../../../features/sub_categories/domain/use_cases/get_sub_categories_use_case.dart';
import '../../../features/coupons/domain/use_cases/get_coupons_use_case.dart';
import '../../../features/sub_categories_items/domain/use_cases/add_marka_use_case.dart';
import '../../../features/sub_categories_items/domain/use_cases/delete_marka_use_case.dart';
import '../../../features/sub_categories_items/domain/use_cases/edit_marka_use_case.dart';
import '../../../features/sub_categories_items/domain/use_cases/get_markas_items_use_case.dart';
import '../../../features/users/domain/use_cases/edit_user_use_case.dart';
import '../../../features/users/domain/use_cases/get_users_use_case.dart';
import '../dependency_injection.dart';

class UseCaseModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      //!  Check
      ..registerLazySingleton(
        () => CheckUseCase(
          getIt(),
        ),
      )
      //!  Login
      ..registerLazySingleton(
        () => LoginUseCase(
          getIt(),
        ),
      )
      //!  Countries
      ..registerLazySingleton(
        () => GetCountriesUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddCountryUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteCountryUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditCountryUseCase(
          getIt(),
        ),
      )
      //!  Governorates
      ..registerLazySingleton(
        () => GetGovernoratesUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddGovernorateUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteGovernorateUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditGovernorateUseCase(
          getIt(),
        ),
      )
      //!  Stores
      ..registerLazySingleton(
        () => GetStoresUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddStoreUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditStoreUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteStoreUseCase(
          getIt(),
        ),
      )
      //! OfferGroups
      ..registerLazySingleton(
        () => GetOfferGroupsUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddOfferGroupUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditOfferGroupUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteOfferGroupUseCase(
          getIt(),
        ),
      )

      //!  Offers
      ..registerLazySingleton(
        () => GetOffersUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddOfferUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditOfferUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditOfferImageUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteOfferUseCase(
          getIt(),
        ),
      )
      // ! Products
      ..registerLazySingleton(
        () => GetProductsUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddProductUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditProductUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteProductUseCase(
          getIt(),
        ),
      )
      //!  Categories
      ..registerLazySingleton(
        () => GetCategoriesUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddCategoryUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditCategoryUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteCategoryUseCase(
          getIt(),
        ),
      )
      //!  SubCategories
      ..registerLazySingleton(
        () => GetSubCategoriesUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddSubCategoryUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditSubCategoryUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteSubCategoryUseCase(
          getIt(),
        ),
      )
      //!  Markas
      ..registerLazySingleton(
        () => GetMarkasUseCase(
          markasRepo: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddMarkaUseCase(
          markasRepo: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditMarkaUseCase(
          markasRepo: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteMarkaUseCase(
          markasRepo: getIt(),
        ),
      )

      //!  Coupons
      ..registerLazySingleton(
        () => GetCouponsUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddCouponUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => UpdateCouponUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteCouponUseCase(
          getIt(),
        ),
      )
      //!  Notifications
      ..registerLazySingleton(
        () => GetNotificationsUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditNotificationUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddNotificationUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteNotificationUseCase(
          getIt(),
        ),
      )
      //!  ExternalNotifications
      ..registerLazySingleton(
        () => AddExternalNotificationUseCase(
          externalNotificationsRepo: getIt(),
        ),
      )
      //!  Users
      ..registerLazySingleton(
        () => GetUsersUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditUserUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddUsersUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => NotifyUseCase(
          getIt(),
        ),
      );
  }
}
