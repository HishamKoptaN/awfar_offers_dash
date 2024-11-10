class EditSubCategoryRequestBodyModel {
  static final EditSubCategoryRequestBodyModel _instance =
      EditSubCategoryRequestBodyModel._();
  factory EditSubCategoryRequestBodyModel() {
    return _instance;
  }
  EditSubCategoryRequestBodyModel._();
  int? id;
  String? name;
  int? categoryId;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'store_id': name,
      'category_id': categoryId,
    };
  }
}
