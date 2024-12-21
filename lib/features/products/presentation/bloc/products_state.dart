import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/models/product.dart';
part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loaded() = _Loaded;
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
  const factory ProductsState.success() = _Success;
}
