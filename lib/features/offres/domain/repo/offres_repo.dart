import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/offers_response_model.dart';

abstract class OffersRepo {
  Future<ApiResult<List<Offer>?>> get();

  Future<ApiResult<Offer>> add({
    required FormData formData,
  });
  Future<ApiResult<void>> delete({
    required int id,
  });
  Future<ApiResult<void>> edit({
    required Offer offer,
  });
  Future<ApiResult<void>> editImage({
    required int id,
    required FormData formData,
  });
}
