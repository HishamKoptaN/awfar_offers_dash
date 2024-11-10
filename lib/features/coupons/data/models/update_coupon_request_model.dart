class EditCouponRequestModel {
  static final EditCouponRequestModel _instance = EditCouponRequestModel._();
  factory EditCouponRequestModel() {
    return _instance;
  }
  EditCouponRequestModel._();
  int? id;
  String? description;
  String? code;
  int? storeId;
  String? url;
  factory EditCouponRequestModel.fromJson(Map<String, dynamic> json) {
    _instance.id = json['id'];
    _instance.description = json['description'];
    _instance.code = json['code'];
    _instance.storeId = json['store_id'];
    _instance.url = json['url'];
    return _instance;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'code': code,
        'store_id': storeId,
        'url': url,
      };
}
