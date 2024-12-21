import '../models/user.dart';

class UsersSingleton {
  List<User>? _users;
  static final UsersSingleton _instance = UsersSingleton._internal();
  UsersSingleton._internal();
  static UsersSingleton get instance => _instance;
  List<User>? get users => _users;
  set users(List<User>? users) {
    _users = users;
  }

  void clearUser() {
    _users = null;
  }

  Future<void> add({
    required User category,
  }) async {
    _instance.users!.add(
      category,
    );
  }

  Future<void> replace({
    required User category,
  }) async {
    final index = _instance.users!.indexWhere((c) => c.id == category.id);
    if (index != -1) {
      _instance.users![index] = category;
    } else {
      throw Exception('${category.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.users!.removeWhere(
      (item) => item.id == id,
    );
  }
}
