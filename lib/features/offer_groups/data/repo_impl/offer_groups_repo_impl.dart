import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/offer_group.dart';
import '../../domain/repo/offer_groups_repo.dart';
import '../data_sources/offer_groups_api.dart';
import '../models/add_offer_group_req_body_model.dart';

class OfferGroupsRepoImpl implements OfferGroupsRepo {
  final OfferGroupsApi offerGroupsApi;
  OfferGroupsRepoImpl(
    this.offerGroupsApi,
  );
  @override
  Future<ApiResult<List<OfferGroup>?>> get({
    required int storeId,
  }) async {
    try {
      final response = await offerGroupsApi.get(
        storeId: storeId,
      );
      return ApiResult.success(
        data: response!,
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
  Future<ApiResult<OfferGroup>> add({
    required AddOfferGroupReqBodyModel addOfferGroupReqBodyModel,
  }) async {
    try {
      final response = await offerGroupsApi.add(
        addOfferGroupReqBodyModel: addOfferGroupReqBodyModel,
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
  Future<ApiResult<OfferGroup>> edit({
    required OfferGroup offerGroup,
  }) async {
    try {
      await offerGroupsApi.edit(
        offerGroup: offerGroup,
      );
      return ApiResult.success(
        data: offerGroup,
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
      await offerGroupsApi.delete(
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
