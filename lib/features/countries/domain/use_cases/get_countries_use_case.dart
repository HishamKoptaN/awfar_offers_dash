import '../../../../core/networking/api_result.dart';
import '../../data/models/countries_response_model.dart';
import '../repo/countreis_repo.dart';

class GetCountriesUseCase {
  final CountriesRepo countreisRepo;
  GetCountriesUseCase(
    this.countreisRepo,
  );
  Future<ApiResult<List<Country>?>> get() async {
    return await countreisRepo.get();
  }
}
