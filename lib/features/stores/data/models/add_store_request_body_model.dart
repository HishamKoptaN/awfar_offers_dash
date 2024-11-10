import 'dart:io';
import 'package:dio/dio.dart';

class AddStoreRequestBodyModel {
  static final AddStoreRequestBodyModel _instance =
      AddStoreRequestBodyModel._();
  factory AddStoreRequestBodyModel() => _instance;
  AddStoreRequestBodyModel._();

  String? name;
  String? countryId;
  String? governorateId;
  String? place;
  MultipartFile? image;

  Future<void> setImageFile(File file) async {
    image = await MultipartFile.fromFile(
      file.path,
      filename: file.path.split('/').last,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country_id': countryId,
      'governorate_id': governorateId,
      'place': place,
    };
  }
}
