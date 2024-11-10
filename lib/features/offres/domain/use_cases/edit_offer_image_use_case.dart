import 'package:dio/dio.dart';
import '../../../../core/networking/api_result.dart';
import '../repo/offres_repo.dart';

class EditOfferImageUseCase {
  final OffersRepo storesRepo;
  EditOfferImageUseCase(
    this.storesRepo,
  );
  Future<ApiResult<void>> edit({
    required int id,
    required FormData formData,
  }) async {
    return await storesRepo.editImage(
      id: id,
      formData: formData,
    );
  }
}
