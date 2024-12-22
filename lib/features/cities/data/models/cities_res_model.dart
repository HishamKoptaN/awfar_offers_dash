import 'package:freezed_annotation/freezed_annotation.dart';
part 'cities_res_model.freezed.dart';
part 'cities_res_model.g.dart';

@freezed
class City with _$City {
  const factory City({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "country_id") int? countryId,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _City;
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
