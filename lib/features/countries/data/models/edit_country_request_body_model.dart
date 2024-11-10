class EditCountryRequestBodyModel {
  // إنشاء instance ثابت لـ Singleton
  static final EditCountryRequestBodyModel _instance =
      EditCountryRequestBodyModel._();
  // إنشاء دالة للوصول إلى instance
  factory EditCountryRequestBodyModel() {
    return _instance;
  }
  // كونستركتور خاص
  EditCountryRequestBodyModel._();
  int? id;
  String? code;
  // دالة لتحميل البيانات من JSON
  factory EditCountryRequestBodyModel.fromJson(Map<String, dynamic> json) {
    _instance.id = json['id'];
    _instance.code = json['code'];
    return _instance;
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
      };
}
