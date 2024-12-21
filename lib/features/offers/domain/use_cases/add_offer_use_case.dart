import 'package:dio/dio.dart';
import '../../../../core/models/offer.dart';
import '../../../../core/networking/api_result.dart';
import '../repo/offres_repo.dart';

class AddOfferUseCase {
  final OffersRepo offersRepo;
  AddOfferUseCase(
    this.offersRepo,
  );
  Future<ApiResult<Offer>> addOffer({
    required FormData formData,
  }) async {
    return await offersRepo.add(
      formData: formData,
    );
  }
}
