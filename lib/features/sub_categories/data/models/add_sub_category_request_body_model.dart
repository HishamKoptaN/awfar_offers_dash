// import 'dart:io';

// import 'package:dio/dio.dart';

// class AddSubCategoryRequestBodyModel {
//   static final AddSubCategoryRequestBodyModel _instance =
//       AddSubCategoryRequestBodyModel._();
//   factory AddSubCategoryRequestBodyModel() {
//     return _instance;
//   }
//   AddSubCategoryRequestBodyModel._();
//   String? name;
//   int? categoryId;
//   MultipartFile? image;

//   Future<void> setImageFile(File file) async {
//     image = await MultipartFile.fromFile(
//       file.path,
//       filename: file.path.split('/').last,
//     );
//   }

//   factory AddSubCategoryRequestBodyModel.fromJson(
//     Map<String, dynamic> json,
//   ) {
//     _instance.name = json['name'];
//     _instance.categoryId = json['category_id'];

//     return _instance;
//   }
//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'category_id': categoryId,
//       };
// }
