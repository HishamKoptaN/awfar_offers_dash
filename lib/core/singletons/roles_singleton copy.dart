import '../models/role.dart';

class RolesSingleton {
  static final RolesSingleton _instance = RolesSingleton._internal();
  RolesSingleton._internal();
  List<Role> _roles = [];
  static RolesSingleton get instance => _instance;
  List<Role> get roles => _roles;
  set roles(List<Role> rolesList) {
    _roles = rolesList;
  }

  void clear() {
    _roles = [];
  }

  Future<void> add({
    required Role role,
  }) async {
    _instance.roles.add(
      role,
    );
  }

  Future<void> replace({
    required Role role,
  }) async {
    final index = _instance.roles.indexWhere((r) => r.id == role.id);
    if (index != -1) {
      _instance.roles[index] = role;
    } else {
      throw Exception('Role with id ${role.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.roles.removeWhere(
      (item) => item.id == id,
    );
  }
}
