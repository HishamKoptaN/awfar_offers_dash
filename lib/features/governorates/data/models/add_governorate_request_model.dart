class AddGovernorateRequestModel {
  static final AddGovernorateRequestModel _instance =
      AddGovernorateRequestModel._();
  factory AddGovernorateRequestModel() {
    return _instance;
  }
  AddGovernorateRequestModel._();
  String? name;
  int? countryId;
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
