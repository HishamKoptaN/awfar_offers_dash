class AddCategoryRequestBodyModel {
  static final AddCategoryRequestBodyModel _instance =
      AddCategoryRequestBodyModel._();
  factory AddCategoryRequestBodyModel() {
    return _instance;
  }
  AddCategoryRequestBodyModel._();
  String? name;
  factory AddCategoryRequestBodyModel.fromJson(Map<String, dynamic> json) {
    _instance.name = json['name'];
    return _instance;
  }
  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
