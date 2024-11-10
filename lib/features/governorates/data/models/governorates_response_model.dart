import 'package:freezed_annotation/freezed_annotation.dart';
part 'governorates_response_model.freezed.dart';
part 'governorates_response_model.g.dart';

class GovernoratesResponseModel {
  static final GovernoratesResponseModel _instance =
      GovernoratesResponseModel._();
  factory GovernoratesResponseModel() => _instance;

  GovernoratesResponseModel._();
  List<Governorate>? governorates;
  Future<void> load(
    List<Governorate>? governorates,
  ) async {
    _instance.governorates = governorates;
  }

  Future<void> add({
    required Governorate governorate,
  }) async {
    _instance.governorates!.add(
      governorate,
    );
  }

  Future<void> replace({
    required Governorate governorate,
  }) async {
    final index =
        _instance.governorates!.indexWhere((s) => s.id == governorate.id);
    if (index != -1) {
      _instance.governorates![index] = governorate;
    } else {
      throw Exception('${governorate.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.governorates!.removeWhere(
      (item) => item.id == id,
    );
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
