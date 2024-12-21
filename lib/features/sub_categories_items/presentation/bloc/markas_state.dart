import 'package:freezed_annotation/freezed_annotation.dart';
part 'markas_state.freezed.dart';

@freezed
class MarkasState with _$MarkasState {
  const factory MarkasState.initial() = _Initial;
  const factory MarkasState.loaded() = _loaded;
  const factory MarkasState.loading() = _Loading;
  const factory MarkasState.success() = _Success;
  const factory MarkasState.failure({
    required String error,
  }) = _Error;
}
