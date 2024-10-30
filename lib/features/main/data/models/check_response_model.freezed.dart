// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckResponseModel _$CheckResponseModelFromJson(Map<String, dynamic> json) {
  return _CheckResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CheckResponseModel {
  bool get status => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  /// Serializes this CheckResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckResponseModelCopyWith<CheckResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckResponseModelCopyWith<$Res> {
  factory $CheckResponseModelCopyWith(
          CheckResponseModel value, $Res Function(CheckResponseModel) then) =
      _$CheckResponseModelCopyWithImpl<$Res, CheckResponseModel>;
  @useResult
  $Res call({bool status, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$CheckResponseModelCopyWithImpl<$Res, $Val extends CheckResponseModel>
    implements $CheckResponseModelCopyWith<$Res> {
  _$CheckResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  /// Create a copy of CheckResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckResponseModelImplCopyWith<$Res>
    implements $CheckResponseModelCopyWith<$Res> {
  factory _$$CheckResponseModelImplCopyWith(_$CheckResponseModelImpl value,
          $Res Function(_$CheckResponseModelImpl) then) =
      __$$CheckResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$CheckResponseModelImplCopyWithImpl<$Res>
    extends _$CheckResponseModelCopyWithImpl<$Res, _$CheckResponseModelImpl>
    implements _$$CheckResponseModelImplCopyWith<$Res> {
  __$$CheckResponseModelImplCopyWithImpl(_$CheckResponseModelImpl _value,
      $Res Function(_$CheckResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
  }) {
    return _then(_$CheckResponseModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckResponseModelImpl implements _CheckResponseModel {
  const _$CheckResponseModelImpl({required this.status, required this.user});

  factory _$CheckResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckResponseModelImplFromJson(json);

  @override
  final bool status;
  @override
  final User user;

  @override
  String toString() {
    return 'CheckResponseModel(status: $status, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, user);

  /// Create a copy of CheckResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckResponseModelImplCopyWith<_$CheckResponseModelImpl> get copyWith =>
      __$$CheckResponseModelImplCopyWithImpl<_$CheckResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CheckResponseModel implements CheckResponseModel {
  const factory _CheckResponseModel(
      {required final bool status,
      required final User user}) = _$CheckResponseModelImpl;

  factory _CheckResponseModel.fromJson(Map<String, dynamic> json) =
      _$CheckResponseModelImpl.fromJson;

  @override
  bool get status;
  @override
  User get user;

  /// Create a copy of CheckResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckResponseModelImplCopyWith<_$CheckResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "account_number")
  String get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "online_offline")
  String get onlineOffline => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: "account_info")
  String get accountInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "plan_id")
  int get planId => throw _privateConstructorUsedError;
  @JsonKey(name: "refered_by")
  dynamic get referedBy => throw _privateConstructorUsedError;
  @JsonKey(name: "confirmation_code")
  dynamic get confirmationCode => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_verified_at")
  String get phoneVerifiedAt => throw _privateConstructorUsedError;
  String get refcode => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_verification_code")
  String get phoneVerificationCode => throw _privateConstructorUsedError;
  @JsonKey(name: "upgraded_at")
  String get upgradedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "email_verified_at")
  dynamic get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "inactivate_end_at")
  dynamic get inactivateEndAt => throw _privateConstructorUsedError;
  @JsonKey(name: "remember_token")
  dynamic get rememberToken => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String status,
      @JsonKey(name: "account_number") String accountNumber,
      @JsonKey(name: "online_offline") String onlineOffline,
      String token,
      String name,
      String username,
      String password,
      String email,
      String image,
      String address,
      String phone,
      double balance,
      String comment,
      @JsonKey(name: "account_info") String accountInfo,
      @JsonKey(name: "plan_id") int planId,
      @JsonKey(name: "refered_by") dynamic referedBy,
      @JsonKey(name: "confirmation_code") dynamic confirmationCode,
      @JsonKey(name: "phone_verified_at") String phoneVerifiedAt,
      String refcode,
      @JsonKey(name: "phone_verification_code") String phoneVerificationCode,
      @JsonKey(name: "upgraded_at") String upgradedAt,
      @JsonKey(name: "email_verified_at") dynamic emailVerifiedAt,
      @JsonKey(name: "inactivate_end_at") dynamic inactivateEndAt,
      @JsonKey(name: "remember_token") dynamic rememberToken,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? accountNumber = null,
    Object? onlineOffline = null,
    Object? token = null,
    Object? name = null,
    Object? username = null,
    Object? password = null,
    Object? email = null,
    Object? image = null,
    Object? address = null,
    Object? phone = null,
    Object? balance = null,
    Object? comment = null,
    Object? accountInfo = null,
    Object? planId = null,
    Object? referedBy = freezed,
    Object? confirmationCode = freezed,
    Object? phoneVerifiedAt = null,
    Object? refcode = null,
    Object? phoneVerificationCode = null,
    Object? upgradedAt = null,
    Object? emailVerifiedAt = freezed,
    Object? inactivateEndAt = freezed,
    Object? rememberToken = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      onlineOffline: null == onlineOffline
          ? _value.onlineOffline
          : onlineOffline // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      accountInfo: null == accountInfo
          ? _value.accountInfo
          : accountInfo // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      referedBy: freezed == referedBy
          ? _value.referedBy
          : referedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      confirmationCode: freezed == confirmationCode
          ? _value.confirmationCode
          : confirmationCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneVerifiedAt: null == phoneVerifiedAt
          ? _value.phoneVerifiedAt
          : phoneVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneVerificationCode: null == phoneVerificationCode
          ? _value.phoneVerificationCode
          : phoneVerificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      upgradedAt: null == upgradedAt
          ? _value.upgradedAt
          : upgradedAt // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inactivateEndAt: freezed == inactivateEndAt
          ? _value.inactivateEndAt
          : inactivateEndAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String status,
      @JsonKey(name: "account_number") String accountNumber,
      @JsonKey(name: "online_offline") String onlineOffline,
      String token,
      String name,
      String username,
      String password,
      String email,
      String image,
      String address,
      String phone,
      double balance,
      String comment,
      @JsonKey(name: "account_info") String accountInfo,
      @JsonKey(name: "plan_id") int planId,
      @JsonKey(name: "refered_by") dynamic referedBy,
      @JsonKey(name: "confirmation_code") dynamic confirmationCode,
      @JsonKey(name: "phone_verified_at") String phoneVerifiedAt,
      String refcode,
      @JsonKey(name: "phone_verification_code") String phoneVerificationCode,
      @JsonKey(name: "upgraded_at") String upgradedAt,
      @JsonKey(name: "email_verified_at") dynamic emailVerifiedAt,
      @JsonKey(name: "inactivate_end_at") dynamic inactivateEndAt,
      @JsonKey(name: "remember_token") dynamic rememberToken,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? accountNumber = null,
    Object? onlineOffline = null,
    Object? token = null,
    Object? name = null,
    Object? username = null,
    Object? password = null,
    Object? email = null,
    Object? image = null,
    Object? address = null,
    Object? phone = null,
    Object? balance = null,
    Object? comment = null,
    Object? accountInfo = null,
    Object? planId = null,
    Object? referedBy = freezed,
    Object? confirmationCode = freezed,
    Object? phoneVerifiedAt = null,
    Object? refcode = null,
    Object? phoneVerificationCode = null,
    Object? upgradedAt = null,
    Object? emailVerifiedAt = freezed,
    Object? inactivateEndAt = freezed,
    Object? rememberToken = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      onlineOffline: null == onlineOffline
          ? _value.onlineOffline
          : onlineOffline // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      accountInfo: null == accountInfo
          ? _value.accountInfo
          : accountInfo // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      referedBy: freezed == referedBy
          ? _value.referedBy
          : referedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      confirmationCode: freezed == confirmationCode
          ? _value.confirmationCode
          : confirmationCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneVerifiedAt: null == phoneVerifiedAt
          ? _value.phoneVerifiedAt
          : phoneVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneVerificationCode: null == phoneVerificationCode
          ? _value.phoneVerificationCode
          : phoneVerificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      upgradedAt: null == upgradedAt
          ? _value.upgradedAt
          : upgradedAt // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inactivateEndAt: freezed == inactivateEndAt
          ? _value.inactivateEndAt
          : inactivateEndAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.status,
      @JsonKey(name: "account_number") required this.accountNumber,
      @JsonKey(name: "online_offline") required this.onlineOffline,
      required this.token,
      required this.name,
      required this.username,
      required this.password,
      required this.email,
      required this.image,
      required this.address,
      required this.phone,
      required this.balance,
      required this.comment,
      @JsonKey(name: "account_info") required this.accountInfo,
      @JsonKey(name: "plan_id") required this.planId,
      @JsonKey(name: "refered_by") this.referedBy,
      @JsonKey(name: "confirmation_code") this.confirmationCode,
      @JsonKey(name: "phone_verified_at") required this.phoneVerifiedAt,
      required this.refcode,
      @JsonKey(name: "phone_verification_code")
      required this.phoneVerificationCode,
      @JsonKey(name: "upgraded_at") required this.upgradedAt,
      @JsonKey(name: "email_verified_at") this.emailVerifiedAt,
      @JsonKey(name: "inactivate_end_at") this.inactivateEndAt,
      @JsonKey(name: "remember_token") this.rememberToken,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String status;
  @override
  @JsonKey(name: "account_number")
  final String accountNumber;
  @override
  @JsonKey(name: "online_offline")
  final String onlineOffline;
  @override
  final String token;
  @override
  final String name;
  @override
  final String username;
  @override
  final String password;
  @override
  final String email;
  @override
  final String image;
  @override
  final String address;
  @override
  final String phone;
  @override
  final double balance;
  @override
  final String comment;
  @override
  @JsonKey(name: "account_info")
  final String accountInfo;
  @override
  @JsonKey(name: "plan_id")
  final int planId;
  @override
  @JsonKey(name: "refered_by")
  final dynamic referedBy;
  @override
  @JsonKey(name: "confirmation_code")
  final dynamic confirmationCode;
  @override
  @JsonKey(name: "phone_verified_at")
  final String phoneVerifiedAt;
  @override
  final String refcode;
  @override
  @JsonKey(name: "phone_verification_code")
  final String phoneVerificationCode;
  @override
  @JsonKey(name: "upgraded_at")
  final String upgradedAt;
  @override
  @JsonKey(name: "email_verified_at")
  final dynamic emailVerifiedAt;
  @override
  @JsonKey(name: "inactivate_end_at")
  final dynamic inactivateEndAt;
  @override
  @JsonKey(name: "remember_token")
  final dynamic rememberToken;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;

  @override
  String toString() {
    return 'User(id: $id, status: $status, accountNumber: $accountNumber, onlineOffline: $onlineOffline, token: $token, name: $name, username: $username, password: $password, email: $email, image: $image, address: $address, phone: $phone, balance: $balance, comment: $comment, accountInfo: $accountInfo, planId: $planId, referedBy: $referedBy, confirmationCode: $confirmationCode, phoneVerifiedAt: $phoneVerifiedAt, refcode: $refcode, phoneVerificationCode: $phoneVerificationCode, upgradedAt: $upgradedAt, emailVerifiedAt: $emailVerifiedAt, inactivateEndAt: $inactivateEndAt, rememberToken: $rememberToken, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.onlineOffline, onlineOffline) ||
                other.onlineOffline == onlineOffline) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.accountInfo, accountInfo) ||
                other.accountInfo == accountInfo) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            const DeepCollectionEquality().equals(other.referedBy, referedBy) &&
            const DeepCollectionEquality()
                .equals(other.confirmationCode, confirmationCode) &&
            (identical(other.phoneVerifiedAt, phoneVerifiedAt) ||
                other.phoneVerifiedAt == phoneVerifiedAt) &&
            (identical(other.refcode, refcode) || other.refcode == refcode) &&
            (identical(other.phoneVerificationCode, phoneVerificationCode) ||
                other.phoneVerificationCode == phoneVerificationCode) &&
            (identical(other.upgradedAt, upgradedAt) ||
                other.upgradedAt == upgradedAt) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            const DeepCollectionEquality()
                .equals(other.inactivateEndAt, inactivateEndAt) &&
            const DeepCollectionEquality()
                .equals(other.rememberToken, rememberToken) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        status,
        accountNumber,
        onlineOffline,
        token,
        name,
        username,
        password,
        email,
        image,
        address,
        phone,
        balance,
        comment,
        accountInfo,
        planId,
        const DeepCollectionEquality().hash(referedBy),
        const DeepCollectionEquality().hash(confirmationCode),
        phoneVerifiedAt,
        refcode,
        phoneVerificationCode,
        upgradedAt,
        const DeepCollectionEquality().hash(emailVerifiedAt),
        const DeepCollectionEquality().hash(inactivateEndAt),
        const DeepCollectionEquality().hash(rememberToken),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      required final String status,
      @JsonKey(name: "account_number") required final String accountNumber,
      @JsonKey(name: "online_offline") required final String onlineOffline,
      required final String token,
      required final String name,
      required final String username,
      required final String password,
      required final String email,
      required final String image,
      required final String address,
      required final String phone,
      required final double balance,
      required final String comment,
      @JsonKey(name: "account_info") required final String accountInfo,
      @JsonKey(name: "plan_id") required final int planId,
      @JsonKey(name: "refered_by") final dynamic referedBy,
      @JsonKey(name: "confirmation_code") final dynamic confirmationCode,
      @JsonKey(name: "phone_verified_at") required final String phoneVerifiedAt,
      required final String refcode,
      @JsonKey(name: "phone_verification_code")
      required final String phoneVerificationCode,
      @JsonKey(name: "upgraded_at") required final String upgradedAt,
      @JsonKey(name: "email_verified_at") final dynamic emailVerifiedAt,
      @JsonKey(name: "inactivate_end_at") final dynamic inactivateEndAt,
      @JsonKey(name: "remember_token") final dynamic rememberToken,
      @JsonKey(name: "created_at") required final String createdAt,
      @JsonKey(name: "updated_at")
      required final String updatedAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get status;
  @override
  @JsonKey(name: "account_number")
  String get accountNumber;
  @override
  @JsonKey(name: "online_offline")
  String get onlineOffline;
  @override
  String get token;
  @override
  String get name;
  @override
  String get username;
  @override
  String get password;
  @override
  String get email;
  @override
  String get image;
  @override
  String get address;
  @override
  String get phone;
  @override
  double get balance;
  @override
  String get comment;
  @override
  @JsonKey(name: "account_info")
  String get accountInfo;
  @override
  @JsonKey(name: "plan_id")
  int get planId;
  @override
  @JsonKey(name: "refered_by")
  dynamic get referedBy;
  @override
  @JsonKey(name: "confirmation_code")
  dynamic get confirmationCode;
  @override
  @JsonKey(name: "phone_verified_at")
  String get phoneVerifiedAt;
  @override
  String get refcode;
  @override
  @JsonKey(name: "phone_verification_code")
  String get phoneVerificationCode;
  @override
  @JsonKey(name: "upgraded_at")
  String get upgradedAt;
  @override
  @JsonKey(name: "email_verified_at")
  dynamic get emailVerifiedAt;
  @override
  @JsonKey(name: "inactivate_end_at")
  dynamic get inactivateEndAt;
  @override
  @JsonKey(name: "remember_token")
  dynamic get rememberToken;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
