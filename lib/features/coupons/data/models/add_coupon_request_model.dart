class AddCouponRequestModel {
  static final AddCouponRequestModel _instance = AddCouponRequestModel._();
  factory AddCouponRequestModel() {
    return _instance;
  }
  AddCouponRequestModel._();
  String? description;
  String? code;
  String? storeId;
  String? url;
  factory AddCouponRequestModel.fromJson(Map<String, dynamic> json) {
    _instance.description = json['description'];
    _instance.code = json['code'];
    _instance.storeId = json['store_id'];
    _instance.url = json['url'];
    return _instance;
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'code': code,
        'store_id': storeId,
        'url': url,
      };
}
