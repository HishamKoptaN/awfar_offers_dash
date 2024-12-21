import 'package:awfar_offers_dash/features/sub_categories_items/data/models/add_marka_req_body_model.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/markas_repo.dart';
import '../data_sources/markas_api.dart';
import '../models/marka.dart';

class MarkasRepoImpl implements MarkasRepo {
  final MarkasApi markasApi;
  MarkasRepoImpl({
    required this.markasApi,
  });
  @override
  Future<ApiResult<List<Marka>>> get({
    required int id,
  }) async {
    try {
      final response = await markasApi.get(
        id: id,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<Marka>> add(
      {required AddMarkaReqBodyModel addMarkaReqBodyModel}) async {
    try {
      final response = await markasApi.add(
        addMarkaReqBodyModel: addMarkaReqBodyModel,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<Marka>> edit({
    required Marka subCategoryItem,
  }) async {
    try {
      final response = await markasApi.edit(
        subCategoryItem: subCategoryItem,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<void>> delete({
    required int id,
  }) async {
    try {
      await markasApi.delete(
        id: id,
      );
      return const ApiResult.success(
        data: null,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
