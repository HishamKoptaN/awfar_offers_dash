import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../stores/data/models/store.dart';

part 'coupon.freezed.dart';
part 'coupon.g.dart';

@freezed
class Coupon with _$Coupon {
  const factory Coupon({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "code") @Default("") String code,
    @JsonKey(name: "store_id") @Default(0) int storeId,
    @JsonKey(name: "category_id") @Default(0) int categoryId,
    @JsonKey(name: "url") @Default("") String url,
    @JsonKey(name: "description") @Default("") String description,
    @JsonKey(name: "is_work") @Default(false) bool isWork,
    @JsonKey(name: "created_at") @Default("") String createdAt,
    @JsonKey(name: "updated_at") @Default("") String updatedAt,
    @JsonKey(name: "store") Store? store,
  }) = _Coupon;

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}
