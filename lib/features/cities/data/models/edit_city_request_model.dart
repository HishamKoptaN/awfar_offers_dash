class EditCityReqModel {
  static final EditCityReqModel _instance = EditCityReqModel._();
  factory EditCityReqModel() {
    return _instance;
  }
  EditCityReqModel._();
  int? id;
  String? name;
  int? countryId;
  factory EditCityReqModel.fromJson(Map<String, dynamic> json) {
    _instance.id = json['id'];
    _instance.name = json['name'];
    _instance.countryId = json['country_id'];
    return _instance;
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country_id': countryId,
      };
}
