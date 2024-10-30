import 'package:freezed_annotation/freezed_annotation.dart';
part 'governorates_response_model.freezed.dart';
part 'governorates_response_model.g.dart';

class GovernoratesResponseModel {
  static final GovernoratesResponseModel _instance =
      GovernoratesResponseModel._();
  factory GovernoratesResponseModel() => _instance;

  GovernoratesResponseModel._();
  List<Governorate>? governorates;
  Future<void> loadCategories(
    List<Governorate>? governorates,
  ) async {
    _instance.governorates = governorates;
  }

  Map<String, dynamic> toJson() => {
        'governorates': governorates?.map((gov) => gov.toJson()).toList(),
      };
}

@freezed
class Governorate with _$Governorate {
  const factory Governorate({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "country_id") int? countryId,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _Governorate;
  factory Governorate.fromJson(Map<String, dynamic> json) =>
      _$GovernorateFromJson(json);
}
