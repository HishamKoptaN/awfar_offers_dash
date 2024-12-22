import '../../../../core/networking/api_result.dart';
import '../../data/models/edit_city_request_model.dart';
import '../../data/models/cities_res_model.dart';
import '../repo/cities_repo.dart';

class EditCityUseCase {
  final CitiesRepo citiesRepo;
  EditCityUseCase(
    this.citiesRepo,
  );
  Future<ApiResult<City>> edit({
    required EditCityReqModel editCityReqModel,
  }) async {
    return await citiesRepo.edit(
      editCityReqModel: editCityReqModel,
    );
  }
}
