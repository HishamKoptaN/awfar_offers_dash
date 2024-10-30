// To parse this JSON data, do
//
//     final storesResponseModel = storesResponseModelFromJson(jsonString);
import 'package:freezed_annotation/freezed_annotation.dart';
part 'stores_response_model.freezed.dart';
part 'stores_response_model.g.dart';

class StoresResponseModel {
  static final StoresResponseModel _instance = StoresResponseModel._();
  factory StoresResponseModel() => _instance;
  StoresResponseModel._();
  List<Store>? stores;
  Future<void> loadstores(List<Store>? stores) async {
    _instance.stores = stores;
  }
}

@freezed
class Store with _$Store {
  const factory Store({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "country_id") int? countryId,
    @JsonKey(name: "governorate_id") int? governorateId,
    @JsonKey(name: "place") String? place,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
