import '../../../features/categories/presentation/bloc/categories_bloc.dart';
import '../../../features/countries/presentation/bloc/countries_bloc.dart';
import '../../../features/governorates/presentation/bloc/governorates_bloc.dart';
import '../../../features/main/presentation/bloc/main_bloc.dart';
import '../../../features/offres/presentation/bloc/offers_bloc.dart';
import '../../../features/stores/presentation/bloc/stores_bloc.dart';
import '../../../features/sub_categories/presentation/bloc/sub_categories_bloc.dart';
import '../../../features/coupons/presentation/bloc/coupons_bloc.dart';
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
      //! Countries
      ..registerLazySingleton<CountriesBloc>(
        () => CountriesBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
      )
      //! Governorates
      ..registerLazySingleton<GovernoratesBloc>(
        () => GovernoratesBloc(
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
          getIt(),
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
      //! Coupons
      ..registerLazySingleton<CouponsBloc>(
        () => CouponsBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
      );
  }
}
