import '../../../../core/networking/api_result.dart';
import '../../data/models/add_marka_req_body_model.dart';
import '../../data/models/marka.dart';

abstract class MarkasRepo {
  Future<ApiResult<List<Marka>>> get({
    required int id,
  });
  Future<ApiResult<Marka>> add({
    required AddMarkaReqBodyModel addMarkaReqBodyModel,
  });
  Future<ApiResult<Marka>> edit({
    required Marka subCategoryItem,
  });

  Future<ApiResult<void>> delete({
    required int id,
  });
}
