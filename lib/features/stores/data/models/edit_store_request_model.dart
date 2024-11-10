class EditStoreRequestBodyModel {
  static final EditStoreRequestBodyModel _instance =
      EditStoreRequestBodyModel._();
  factory EditStoreRequestBodyModel() {
    return _instance;
  }
  EditStoreRequestBodyModel._();
  int? id;
  String? name;
  int? countryId;
  int? governorateId;
  String? place;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country_id': countryId,
      'governorate_id': governorateId,
      'place': place,
    };
  }
}
