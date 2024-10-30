import 'package:awfar_offers_dash/features/governorates/data/models/governorates_response_model.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/add_governorate_request_model.dart';

abstract class GovernoratesRepo {
  Future<ApiResult<List<Governorate>?>> getGovernorates();
  Future<ApiResult<List<Governorate>?>> addGovernorate({
    required AddGovernorateRequestModel addGovernorateRequestModel,
  });
  Future<ApiResult<List<Governorate>?>> deleteGovernorate({
    required int id,
  });
}
