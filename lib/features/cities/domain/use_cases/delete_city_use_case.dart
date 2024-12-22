import '../../../../core/networking/api_result.dart';
import '../repo/cities_repo.dart';

class DeleteCityUseCase {
  final CitiesRepo citiesRepo;
  DeleteCityUseCase(
    this.citiesRepo,
  );
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    return await citiesRepo.delete(
      id: id,
    );
  }
}
