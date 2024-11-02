import 'dart:io';

import 'package:dio/dio.dart';

class AddOfferRequestBodyModel {
  // إنشاء instance ثابت لـ Singleton
  static final AddOfferRequestBodyModel _instance =
      AddOfferRequestBodyModel._();
  // إنشاء دالة للوصول إلى instance
  factory AddOfferRequestBodyModel() {
    return _instance;
  }
  AddOfferRequestBodyModel._();
  String? name;
  String? storeId;
  String? categoryId;
  MultipartFile? image;

  Future<void> setImageFile(File file) async {
    image = await MultipartFile.fromFile(
      file.path,
      filename: file.path.split('/').last,
    );
  }

  factory AddOfferRequestBodyModel.fromJson(Map<String, dynamic> json) {
    _instance.name = json['name'];
    _instance.storeId = json['store_id'];
    _instance.categoryId = json['category_id'];
    return _instance;
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'store_id': storeId,
        'category_id': categoryId,
      };
}
