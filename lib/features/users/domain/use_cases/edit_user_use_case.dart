import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repo/users_repo.dart';

class EditUserUseCase {
  final UsersRepo usersRepo;
  EditUserUseCase(
    this.usersRepo,
  );
  Future<ApiResult<User>> edit({
    required User user,
  }) async {
    return await usersRepo.edit(
      user: user,
    );
  }
}
