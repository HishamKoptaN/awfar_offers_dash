class NotifyReq {
  static final NotifyReq _instance = NotifyReq._();
  factory NotifyReq() {
    return _instance;
  }
  NotifyReq._();
  List<int>? usersId;
  String? message;
  bool? public;
  factory NotifyReq.fromJson(Map<String, dynamic> json) {
    _instance.usersId = json['users_id'];
    _instance.message = json['message'];
    _instance.public = json['public'];
    return _instance;
  }
  Map<String, dynamic> toJson() => {
        'users_id': usersId,
        'message': message,
        'public': public,
      };
}
