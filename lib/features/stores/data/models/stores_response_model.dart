import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'stores_response_model.freezed.dart';
part 'stores_response_model.g.dart';

class StoresResponseModel {
  static final StoresResponseModel _instance = StoresResponseModel._();
  factory StoresResponseModel() => _instance;
  StoresResponseModel._();
  List<Store>? stores;
  Future<void> load({
    required List<Store>? stores,
  }) async {
    _instance.stores = stores!;
  }

  Future<void> add({
    required Store store,
  }) async {
    _instance.stores!.add(
      store,
    );
  }

  Future<void> replace({
    required Store store,
  }) async {
    final index = _instance.stores!.indexWhere((c) => c.id == store.id);
    if (index != -1) {
      _instance.stores![index] = store;
    } else {
      throw Exception('${store.id} not found');
    }
  }

  void delete({
    required int id,
  }) {
    _instance.stores!.removeWhere(
      (item) => item.id == id,
    );
  }
}

@freezed
class Store with _$Store {
  const factory Store({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "name") @Default("") String name,
    @JsonKey(name: "image") @Default("") String image,
    @JsonKey(name: "country_id") @Default(0) int countryId,
    @JsonKey(name: "governorate_id") @Default(0) int governorateId,
    @JsonKey(name: "place") @Default("") String place,
    @JsonKey(name: "created_at") @Default("") String createdAt,
    @JsonKey(name: "updated_at") @Default("") String updatedAt,
  }) = _Store;
  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
