import '../../../../core/networking/api_result.dart';
import '../../data/models/stores_response_model.dart';

abstract class StoresRepo {
  Future<ApiResult<List<Store>?>> getStores();
}
