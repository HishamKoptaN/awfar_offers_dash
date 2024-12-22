import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
part 'cities_state.freezed.dart';

@freezed
class CitiesState with _$CitiesState {
  const factory CitiesState.initial() = _Initial;
  const factory CitiesState.loaded() = _Loaded;
  const factory CitiesState.loading() = _Loading;
  const factory CitiesState.success() = _Success;
  const factory CitiesState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
