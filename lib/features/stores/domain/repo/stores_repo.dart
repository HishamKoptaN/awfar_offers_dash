import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/stores_response_model.dart';

abstract class StoresRepo {
  Future<ApiResult<List<Store>>> get();
  Future<ApiResult<void>> addStore({
    required FormData formData,
  });
  Future<ApiResult<void>> delete({
    required int id,
  });
  Future<ApiResult<void>> edit({
    required Store store,
  });
  Future<ApiResult<void>> editImage({
    required int id,
    required FormData formData,
  });
}
