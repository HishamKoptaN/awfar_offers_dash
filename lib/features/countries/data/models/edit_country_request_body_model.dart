class EditCountryRequestBodyModel {
  static final EditCountryRequestBodyModel _instance =
      EditCountryRequestBodyModel._();
  factory EditCountryRequestBodyModel() {
    return _instance;
  }
  EditCountryRequestBodyModel._();
  int? id;
  String? code;
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
