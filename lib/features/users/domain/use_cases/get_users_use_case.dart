import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repo/users_repo.dart';

class GetUsersUseCase {
  final UsersRepo usersRepo;
  GetUsersUseCase(
    this.usersRepo,
  );
  Future<ApiResult<List<User>>> get() async {
    return await usersRepo.get();
  }
}
