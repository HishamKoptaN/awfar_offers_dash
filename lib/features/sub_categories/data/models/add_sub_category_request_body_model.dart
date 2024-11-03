import 'dart:io';

import 'package:dio/dio.dart';

class AddSubCategoryRequestBodyModel {
  // إنشاء instance ثابت لـ Singleton
  static final AddSubCategoryRequestBodyModel _instance =
      AddSubCategoryRequestBodyModel._();
  // إنشاء دالة للوصول إلى instance
  factory AddSubCategoryRequestBodyModel() {
    return _instance;
  }
  // كونستركتور خاص
  AddSubCategoryRequestBodyModel._();
  String? name;
  int? categoryId;
  MultipartFile? image;

  Future<void> setImageFile(File file) async {
    image = await MultipartFile.fromFile(
      file.path,
      filename: file.path.split('/').last,
    );
  }

  // دالة لتحميل البيانات من JSON
  factory AddSubCategoryRequestBodyModel.fromJson(
    Map<String, dynamic> json,
  ) {
    _instance.name = json['name'];
    _instance.categoryId = json['category_id'];

    return _instance;
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'category_id': categoryId,
      };
}
