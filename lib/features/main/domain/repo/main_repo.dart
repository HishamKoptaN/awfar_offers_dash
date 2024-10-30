import '../../../../../core/networking/api_result.dart';
import '../../data/models/check_response_model.dart';

abstract class MainRepo {
  Future<ApiResult<CheckResponseModel>> check();
}
