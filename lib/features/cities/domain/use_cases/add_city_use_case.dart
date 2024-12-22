import '../../../../core/networking/api_result.dart';
import '../../data/models/add_city_req_model.dart';
import '../../data/models/cities_res_model.dart';
import '../repo/cities_repo.dart';

class AddCityUseCase {
  final CitiesRepo citiesRepo;
  AddCityUseCase(
    this.citiesRepo,
  );
  Future<ApiResult<City>> add({
    required AddCityReqModel addCityReqModel,
  }) async {
    return await citiesRepo.add(
      addCityReqModel: addCityReqModel,
    );
  }
}
