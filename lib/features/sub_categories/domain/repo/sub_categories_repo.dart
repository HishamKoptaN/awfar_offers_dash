import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/sub_categories_response_model.dart';

abstract class SubCategoriesRepo {
  Future<ApiResult<List<SubCategory>>> get();
  Future<ApiResult<SubCategory>> add({
    required FormData formData,
  });

  Future<ApiResult<SubCategory>> edit({
    required int id,
    required FormData formData,
  });

  Future<ApiResult<void>> delete({
    required int id,
  });
}
