import '../../features/permissions/data/model/permission.dart';

class PermissionsSingleton {
  static final PermissionsSingleton _instance =
      PermissionsSingleton._internal();
  PermissionsSingleton._internal();
  List<Permission> _permissions = [];
  static PermissionsSingleton get instance => _instance;
  List<Permission> get permissions => _permissions;
  set permissions(List<Permission> permissionsList) {
    _permissions = permissionsList;
  }

  void clear() {
    _permissions = [];
  }

  Future<void> add({
    required Permission notification,
  }) async {
    _instance.permissions.add(
      notification,
    );
  }

  Future<void> replace({
    required Permission notification,
  }) async {
    final index =
        _instance.permissions.indexWhere((c) => c.id == notification.id);
    if (index != -1) {
      _instance.permissions[index] = notification;
    } else {
      throw Exception('Permission with id ${notification.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.permissions.removeWhere(
      (item) => item.id == id,
    );
  }
}
