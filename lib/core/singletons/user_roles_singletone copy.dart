import '../models/role.dart';

class UserRolesSingleton {
  static final UserRolesSingleton _instance = UserRolesSingleton._internal();
  factory UserRolesSingleton() => _instance;
  UserRolesSingleton._internal();
  static UserRolesSingleton get instance => _instance;
  List<Role> _userRoles = [];
  List<Role> get userRoles => _userRoles;
  set userRoles(List<Role> userRolesList) {
    _userRoles = userRolesList;
  }

  bool hasPermissionForRole({
    required int permissionId,
  }) {
    return _userRoles.any(
      (role) => role.permissions!.any(
        (permission) => permission.id == permissionId,
      ),
    );
  }
}
