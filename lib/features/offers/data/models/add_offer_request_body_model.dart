import 'dart:io';
import 'package:dio/dio.dart';

class AddOfferRequestBodyModel {
  static final AddOfferRequestBodyModel _instance =
      AddOfferRequestBodyModel._();
  factory AddOfferRequestBodyModel() {
    return _instance;
  }
  AddOfferRequestBodyModel._();
  String? name;
  DateTime? endAt;
  String? storeId;
  String? subCategoryId;
  MultipartFile? image;

  Future<void> setImageFile(File file) async {
    image = await MultipartFile.fromFile(
      file.path,
      filename: file.path.split('/').last,
    );
  }

  factory AddOfferRequestBodyModel.fromJson(
    Map<String, dynamic> json,
  ) {
    _instance.name = json['name'];
    _instance.endAt = json['end_at'];
    _instance.storeId = json['store_id'];
    _instance.subCategoryId = json['sub_category_id'];
    return _instance;
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'end_at': endAt,
        'store_id': storeId,
        'sub_category_id': subCategoryId,
      };
}
