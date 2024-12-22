import '../../../../core/networking/api_result.dart';
import '../../data/models/cities_res_model.dart';
import '../repo/cities_repo.dart';

class GetCitiesUseCase {
  final CitiesRepo citiesRepo;
  GetCitiesUseCase(
    this.citiesRepo,
  );
  Future<ApiResult<List<City>?>> get() async {
    return await citiesRepo.get();
  }
}
