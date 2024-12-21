import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/store.dart';

abstract class StoresRepo {
  Future<ApiResult<List<Store>>> get();
  Future<ApiResult<Store>> add({
    required FormData formData,
  });
  Future<ApiResult<Store>> edit({
    required int id,
    required FormData formData,
  });
  Future<ApiResult<void>> delete({
    required int id,
  });
}
