import '../../../../core/networking/api_result.dart';
import '../../data/models/add_country_request_body_model.dart';
import '../../data/models/countries_response_model.dart';
import '../repo/countreis_repo.dart';

class AddCountryUseCase {
  final CountriesRepo countreisRepo;
  AddCountryUseCase(
    this.countreisRepo,
  );
  Future<ApiResult<List<Country>?>> addCountry({
    required AddCountryRequestModel addCountryRequestModel,
  }) async {
    return await countreisRepo.addCountry(
      addCountryRequestModel: addCountryRequestModel,
    );
  }
}
