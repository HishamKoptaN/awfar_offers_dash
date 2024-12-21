import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repo/users_repo.dart';

class AddUsersUseCase {
  final UsersRepo usersRepo;
  AddUsersUseCase(
    this.usersRepo,
  );
  Future<ApiResult<User>> add({
    required User user,
  }) async {
    return await usersRepo.add(
      user: user,
    );
  }
}
