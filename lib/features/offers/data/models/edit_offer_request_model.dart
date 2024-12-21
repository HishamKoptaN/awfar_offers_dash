class EditOfferRequestBodyModel {
  static final EditOfferRequestBodyModel _instance =
      EditOfferRequestBodyModel._();
  factory EditOfferRequestBodyModel() {
    return _instance;
  }
  EditOfferRequestBodyModel._();
  int? id;
  String? name;
  DateTime? endAt;
  int? storeId;
  int? subCategoryId;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'end_at': endAt,
      'store_id': storeId,
      'sub_category_id': subCategoryId,
    };
  }
}
