import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/product.dart';
part 'products_event.freezed.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.get({
    required int offerId,
  }) = _Get;
  const factory ProductsEvent.add({
    required FormData formData,
  }) = _Add;
  const factory ProductsEvent.edit({
    required Product prdouct,
  }) = _Edit;
}
