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
import '../../../features/governorates/domain/use_cases/add_governorate_use_case.dart';
import '../../../features/governorates/domain/use_cases/delete_governorate_use_case.dart';
import '../../../features/governorates/domain/use_cases/edit_governorate_use_case.dart';
import '../../../features/governorates/domain/use_cases/get_governorates_use_case.dart';
import '../../../features/main/domain/usecases/check_use_case.dart';
import '../../../features/offres/domain/use_cases/add_offer_use_case.dart';
import '../../../features/offres/domain/use_cases/delete_offer_use_case.dart';
import '../../../features/offres/domain/use_cases/edit_offer_image_use_case.dart';
import '../../../features/offres/domain/use_cases/edit_offer_use_case.dart';
import '../../../features/offres/domain/use_cases/get_offres_use_case.dart';
import '../../../features/stores/domain/use_cases/add_store_use_case.dart';
import '../../../features/stores/domain/use_cases/delete_store_use_case.dart';
import '../../../features/stores/domain/use_cases/edit_store_image_use_case.dart';
import '../../../features/stores/domain/use_cases/edit_store_use_case.dart';
import '../../../features/stores/domain/use_cases/get_stores_use_case.dart';
import '../../../features/sub_categories/domain/use_cases/add_sub_category_use_case.dart';
import '../../../features/sub_categories/domain/use_cases/delete_sub_category_use_case.dart';
import '../../../features/sub_categories/domain/use_cases/edit_sub_category_image_use_case.dart';
import '../../../features/sub_categories/domain/use_cases/edit_sub_category_use_case.dart';
import '../../../features/sub_categories/domain/use_cases/get_sub_categories_use_case.dart';
import '../../../features/coupons/domain/use_cases/get_coupons_use_case.dart';
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
        () => EditStoreImageUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteStoreUseCase(
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
        () => EditSubCategoryImageUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DeleteSubCategoryUseCase(
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
      );
  }
}
