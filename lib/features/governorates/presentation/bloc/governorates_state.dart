import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/models/governorates_response_model.dart';
part 'governorates_state.freezed.dart';

@freezed
class GovernoratesState with _$GovernoratesState {
  const factory GovernoratesState.initial() = _Initial;
  const factory GovernoratesState.governoratesLoaded({
    required List<Governorate>? governoratesResponseModel,
  }) = _GovernoratesLoaded;
  const factory GovernoratesState.loading() = _Loading;
  const factory GovernoratesState.success() = _Success;
  const factory GovernoratesState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
