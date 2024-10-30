import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'check_response_model.freezed.dart';
part 'check_response_model.g.dart';

// لتحويل JSON إلى CheckResponseModel والعكس
CheckResponseModel checkResponseModelFromJson(String str) =>
    CheckResponseModel.fromJson(json.decode(str));

String checkResponseModelToJson(CheckResponseModel data) =>
    json.encode(data.toJson());

@freezed
class CheckResponseModel with _$CheckResponseModel {
  const factory CheckResponseModel({
    required bool status,
    required User user,
  }) = _CheckResponseModel;

  factory CheckResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckResponseModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String status,
    @JsonKey(name: "account_number") required String accountNumber,
    @JsonKey(name: "online_offline") required String onlineOffline,
    required String token,
    required String name,
    required String username,
    required String password,
    required String email,
    required String image,
    required String address,
    required String phone,
    required double balance,
    required String comment,
    @JsonKey(name: "account_info") required String accountInfo,
    @JsonKey(name: "plan_id") required int planId,
    @JsonKey(name: "refered_by") dynamic referedBy,
    @JsonKey(name: "confirmation_code") dynamic confirmationCode,
    @JsonKey(name: "phone_verified_at") required String phoneVerifiedAt,
    required String refcode,
    @JsonKey(name: "phone_verification_code")
    required String phoneVerificationCode,
    @JsonKey(name: "upgraded_at") required String upgradedAt,
    @JsonKey(name: "email_verified_at") dynamic emailVerifiedAt,
    @JsonKey(name: "inactivate_end_at") dynamic inactivateEndAt,
    @JsonKey(name: "remember_token") dynamic rememberToken,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
