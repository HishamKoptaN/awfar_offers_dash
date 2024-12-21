import 'package:intl/intl.dart';

class EditOfferReqBodyModel {
  static final EditOfferReqBodyModel _instance = EditOfferReqBodyModel._();
  factory EditOfferReqBodyModel() {
    return _instance;
  }
  EditOfferReqBodyModel._();
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
