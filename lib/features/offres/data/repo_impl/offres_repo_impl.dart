import 'package:dio/dio.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repo/offres_repo.dart';
import '../data_sources/offers_api.dart';
import '../models/offers_response_model.dart';

class OffersRepoImpl implements OffersRepo {
  final OffersApi offersApi;
  OffersRepoImpl(
    this.offersApi,
  );
  @override
  Future<ApiResult<List<Offer>?>> get() async {
    try {
      final response = await offersApi.getOffers();
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
  Future<ApiResult<Offer>> add({
    required FormData formData,
  }) async {
    try {
      final response = await offersApi.addOffer(
        formData: formData,
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
  Future<ApiResult<Offer>> edit({
    required Offer offer,
  }) async {
    try {
      await offersApi.edit(
        offer: offer,
      );
      return ApiResult.success(
        data: offer,
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
  Future<ApiResult<Offer>> editImage({
    required int id,
    required FormData formData,
  }) async {
    try {
      final offer = await offersApi.editImage(
        id: id,
        formData: formData,
      );
      return ApiResult.success(
        data: offer,
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
      await offersApi.delete(
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
