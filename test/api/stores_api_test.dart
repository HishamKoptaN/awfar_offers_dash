import 'package:awfar_offers_dash/core/di/dependency_injection.dart';
import 'package:awfar_offers_dash/core/errors/api_error_model.dart';
import 'package:awfar_offers_dash/core/networking/api_result.dart';
import 'package:awfar_offers_dash/features/stores/data/models/store.dart';
import 'package:awfar_offers_dash/features/stores/domain/repo/stores_repo.dart';
import 'package:awfar_offers_dash/features/stores/domain/use_cases/get_stores_use_case.dart';
import 'package:awfar_offers_dash/features/stores/present/bloc/stores_bloc.dart';
import 'package:awfar_offers_dash/features/stores/present/bloc/stores_event.dart';
import 'package:awfar_offers_dash/features/stores/present/bloc/stores_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mocking dependencies
class MockStoresRepo extends Mock implements StoresRepo {
  @override
  Future<ApiResult<List<Store>>> get() {
    return super.noSuchMethod(
      Invocation.method(#get, []),
      returnValue: Future.value(
          ApiResult.success(data: [])), // مثال محاكاة مع إرجاع قيمة صحيحة
    );
  }
}

void main() async {
  await Injection.inject();
  late StoresBloc storesBloc;
  late MockStoresRepo mockStoresRepo;
  late GetStoresUseCase getStoresUseCase;

  setUp(() {
    mockStoresRepo = MockStoresRepo();
    getStoresUseCase = GetStoresUseCase(mockStoresRepo);
    storesBloc = StoresBloc(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    );
  });

  group('StoresBloc Tests', () {
    // بيانات حقيقية لمحاكاتها في حالة الإنتاج
    List<Store>? mockStores;

    test('should fetch stores successfully and emit StoresLoaded state',
        () async {
      // إعداد المحاكاة لإرجاع بيانات حقيقية
      when(mockStoresRepo.get()).thenAnswer(
        (_) async => ApiResult.success(data: mockStores!),
      );

      // التحقق من الحالة
      blocTest<StoresBloc, StoresState>(
        'emits [StoresLoaded] when stores are fetched successfully',
        build: () => storesBloc,
        act: (bloc) => bloc.add(const StoresEvent.get()),
        expect: () => [
          StoresState.storesLoaded(stores: mockStores),
        ],
      );
    });
  });
}

























  // test(
      //   'should emit failure state when fetching stores fails',
      //   () async {
      //     final apiErrorModel = ApiErrorModel(error: 'Failed to fetch stores');
      //     // Arrange
      //     when(mockStoresRepo.get()).thenAnswer(
      //       (_) async => ApiResult.failure(apiErrorModel: apiErrorModel),
      //     );
      //     // إعداد المحاكاة لإرجاع خطأ
      //     when(mockStoresRepo.get()).thenAnswer(
      //       (_) async => ApiResult.failure(apiErrorModel: apiErrorModel),
      //     );
      //     // التحقق من الحالة
      //     blocTest<StoresBloc, StoresState>(
      //       'emits [Failure] when fetching stores fails',
      //       build: () => storesBloc,
      //       act: (bloc) => bloc.add(const StoresEvent.get()),
      //       expect: () => [
      //         StoresState.failure(apiErrorModel: apiErrorModel),
      //       ],
      //       verify: (_) {
      //         verify(mockStoresRepo.get()).called(1);
      //       },
      //     );
      //   },
      // );