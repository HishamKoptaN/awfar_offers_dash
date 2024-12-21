import '../../../../core/networking/api_result.dart';
import '../../data/models/countries_res_model.dart';
import '../../data/models/edit_country_request_body_model.dart';
import '../repo/countreis_repo.dart';

class EditCountryUseCase {
  final CountriesRepo countreisRepo;
  EditCountryUseCase(
    this.countreisRepo,
  );
  Future<ApiResult<Country>> edit({
    required EditCountryRequestBodyModel editCountryRequestBodyModel,
  }) async {
    return await countreisRepo.edit(
      editCountryRequestBodyModel: editCountryRequestBodyModel,
    );
  }
}
