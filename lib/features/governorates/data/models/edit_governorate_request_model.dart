class EditGovernorateRequestModel {
  static final EditGovernorateRequestModel _instance =
      EditGovernorateRequestModel._();
  factory EditGovernorateRequestModel() {
    return _instance;
  }
  EditGovernorateRequestModel._();
  int? id;
  String? name;
  int? countryId;
  factory EditGovernorateRequestModel.fromJson(Map<String, dynamic> json) {
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
