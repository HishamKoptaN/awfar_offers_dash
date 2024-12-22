import '../../../../core/networking/api_result.dart';
import '../../data/models/add_city_req_model.dart';
import '../../data/models/cities_res_model.dart';
import '../../data/models/edit_city_request_model.dart';

abstract class CitiesRepo {
  Future<ApiResult<List<City>>> get();
  Future<ApiResult<City>> add({
    required AddCityReqModel addCityReqModel,
  });
  Future<ApiResult<void>> delete({
    required int id,
  });
  Future<ApiResult<City>> edit({
    required EditCityReqModel editCityReqModel,
  });
}
