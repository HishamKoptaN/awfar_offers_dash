import 'package:awfar_offers_dash/features/governorates/data/models/governorates_response_model.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/add_governorate_request_model.dart';
import '../../data/models/edit_governorate_request_model.dart';

abstract class GovernoratesRepo {
  Future<ApiResult<List<Governorate>>> get();
  Future<ApiResult<Governorate>> add({
    required AddGovernorateRequestModel addGovernorateRequestModel,
  });
  Future<ApiResult<void>> delete({
    required int id,
  });
  Future<ApiResult<Governorate>> edit({
    required EditGovernorateRequestModel editGovernorateRequestModel,
  });
}
