class AddGovernorateRequestModel {
  // إنشاء instance ثابت لـ Singleton
  static final AddGovernorateRequestModel _instance =
      AddGovernorateRequestModel._();
  // إنشاء دالة للوصول إلى instance
  factory AddGovernorateRequestModel() {
    return _instance;
  }
  // كونستركتور خاص
  AddGovernorateRequestModel._();
  String? name;
  int? countryId;
  // دالة لتحميل البيانات من JSON
  factory AddGovernorateRequestModel.fromJson(Map<String, dynamic> json) {
    _instance.name = json['name'];
    _instance.countryId = json['country_id'];
    return _instance;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'country_id': countryId,
      };
}
