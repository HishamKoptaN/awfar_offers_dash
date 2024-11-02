import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/add_store_request_body_model.dart';
import '../../data/models/stores_response_model.dart';
import '../repo/stores_repo.dart';

class AddStoreUseCase {
  final StoresRepo storesRepo;
  AddStoreUseCase(
    this.storesRepo,
  );

  Future<ApiResult<List<Store>?>> addStore({
    required FormData formData,
  }) async {
    return await storesRepo.addStore(
      formData: formData,
    );
  }
}
