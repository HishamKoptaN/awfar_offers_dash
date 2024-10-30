import '../../../features/categories/data/repo_impl/categories_repo_impl.dart';
import '../../../features/categories/domain/repo/categories_repo.dart';
import '../../../features/countries/data/repo_impl/countreis_repo_impl.dart';
import '../../../features/countries/domain/repo/countreis_repo.dart';
import '../../../features/governorates/data/repo_impl/governates_repo_impl.dart';
import '../../../features/governorates/domain/repo/governorates_repo.dart';
import '../../../features/main/data/repo_impl/main_repo_impl.dart';
import '../../../features/main/domain/repo/main_repo.dart';
import '../../../features/offres/data/repo_impl/offres_repo_impl.dart';
import '../../../features/offres/domain/repo/offres_repo.dart';
import '../../../features/stores/data/repo_impl/stores_repo_impl.dart';
import '../../../features/stores/domain/repo/stores_repo.dart';
import '../dependency_injection.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<MainRepo>(
        () => MainRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<CountriesRepo>(
        () => CountriesRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<GovernoratesRepo>(
        () => GovernoratesRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<StoresRepo>(
        () => StoresRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<CategoriesRepo>(
        () => CategoriesRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<OffersRepo>(
        () => OffersRepoImpl(
          getIt(),
        ),
      );
  }
}
