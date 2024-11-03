import '../../../features/categories/presentation/bloc/categories_bloc.dart';
import '../../../features/countries/presentation/bloc/countries_bloc.dart';
import '../../../features/governorates/presentation/bloc/governorates_bloc.dart';
import '../../../features/main/presentation/bloc/main_bloc.dart';
import '../../../features/offres/presentation/bloc/offres_bloc.dart';
import '../../../features/stores/presentation/bloc/stores_bloc.dart';
import '../../../features/sub_categories/presentation/bloc/sub_categories_bloc.dart';
import '../dependency_injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<MainBloc>(
        () => MainBloc(
          getIt(),
        ),
      )
      ..registerLazySingleton<CountriesBloc>(
        () => CountriesBloc(
          getIt(),
          getIt(),
          getIt(),
        ),
      )
      ..registerLazySingleton<GovernoratesBloc>(
        () => GovernoratesBloc(
          getIt(),
          getIt(),
          getIt(),
        ),
      )
      ..registerLazySingleton<StoresBloc>(
        () => StoresBloc(
          getIt(),
          getIt(),
        ),
      )
      ..registerLazySingleton<CategoriesBloc>(
        () => CategoriesBloc(
          getIt(),
          getIt(),
        ),
      )
      ..registerLazySingleton<SubCategoriesBloc>(
        () => SubCategoriesBloc(
          getIt(),
          getIt(),
        ),
      )
      ..registerLazySingleton<OffersBloc>(
        () => OffersBloc(
          getIt(),
          getIt(),
        ),
      );
  }
}
