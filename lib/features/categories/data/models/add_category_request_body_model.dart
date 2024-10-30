class AddCategoryRequestBodyModel {
  // إنشاء instance ثابت لـ Singleton
  static final AddCategoryRequestBodyModel _instance =
      AddCategoryRequestBodyModel._();
  // إنشاء دالة للوصول إلى instance
  factory AddCategoryRequestBodyModel() {
    return _instance;
  }
  // كونستركتور خاص
  AddCategoryRequestBodyModel._();
  String? name;
  // دالة لتحميل البيانات من JSON
  factory AddCategoryRequestBodyModel.fromJson(Map<String, dynamic> json) {
    _instance.name = json['name'];
    return _instance;
  }
  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
