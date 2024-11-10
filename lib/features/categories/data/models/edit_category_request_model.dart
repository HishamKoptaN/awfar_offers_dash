import 'package:intl/intl.dart';

class EditCategoryRequestBodyModel {
  static final EditCategoryRequestBodyModel _instance =
      EditCategoryRequestBodyModel._();
  factory EditCategoryRequestBodyModel() {
    return _instance;
  }
  EditCategoryRequestBodyModel._();
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'store_id': name,
    };
  }
}
