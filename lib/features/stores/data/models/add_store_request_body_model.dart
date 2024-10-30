class AddStoreRequestBodyModel {
  // إنشاء instance ثابت لـ Singleton
  static final AddStoreRequestBodyModel _instance =
      AddStoreRequestBodyModel._();
  // إنشاء دالة للوصول إلى instance
  factory AddStoreRequestBodyModel() {
    return _instance;
  }
  // كونستركتور خاص
  AddStoreRequestBodyModel._();
  String? name;
  String? countryId;
  String? governorateId;
  String? place;
  String? image;
  // دالة لتحميل البيانات من JSON
  factory AddStoreRequestBodyModel.fromJson(Map<String, dynamic> json) {
    _instance.name = json['name'];
    _instance.countryId = json['country_id'];
    _instance.governorateId = json['governorate_id'];
    _instance.place = json['place'];
    _instance.image = json['image'];

    return _instance;
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'country_id': countryId,
        'governorate_id': governorateId,
        'place': place,
        'image': image,
      };
}
