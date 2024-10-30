import '../../../../core/networking/api_result.dart';
import '../../data/models/countries_response_model.dart';
import '../repo/countreis_repo.dart';

class GetCountrieUseCase {
  final CountriesRepo countreisRepo;
  GetCountrieUseCase(
    this.countreisRepo,
  );
  Future<ApiResult<List<Country>?>> getCountries() async {
    return await countreisRepo.getCountries();
  }
}
