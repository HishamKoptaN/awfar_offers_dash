import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/store.dart';
import '../repo/stores_repo.dart';

class EditStoreUseCase {
  final StoresRepo storesRepo;
  EditStoreUseCase(
    this.storesRepo,
  );
  Future<ApiResult<Store>> edit({
    required int id,
    required FormData formData,
  }) async {
    return await storesRepo.edit(
      id: id,
      formData: formData,
    );
  }
}
