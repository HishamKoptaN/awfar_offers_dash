class AddCityReqModel {
  static final AddCityReqModel _instance = AddCityReqModel._();
  factory AddCityReqModel() {
    return _instance;
  }
  AddCityReqModel._();
  String? name;
  int? countryId;
  factory AddCityReqModel.fromJson(Map<String, dynamic> json) {
    _instance.name = json['name'];
    _instance.countryId = json['country_id'];
    return _instance;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'country_id': countryId,
      };
}
