class AddCountryRequestBodyModel {
  static final AddCountryRequestBodyModel _instance =
      AddCountryRequestBodyModel._();
  factory AddCountryRequestBodyModel() {
    return _instance;
  }
  AddCountryRequestBodyModel._();
  String? code;
  factory AddCountryRequestBodyModel.fromJson(Map<String, dynamic> json) {
    _instance.code = json['code'];
    return _instance;
  }
  Map<String, dynamic> toJson() => {
        'code': code,
      };
}
