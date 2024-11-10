import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/coupons_response_model.dart';
import '../../domain/use_cases/add_coupon_use_case.dart';
import '../../domain/use_cases/delete_coupon_use_case.dart';
import '../../domain/use_cases/get_coupons_use_case.dart';
import '../../domain/use_cases/update_coupon_use_case.dart';
import 'coupons_event.dart';
import 'coupons_state.dart';

class CouponsBloc extends Bloc<CouponsEvent, CouponsState> {
  final GetCouponsUseCase getCouponsUseCase;
  final AddCouponUseCase addCouponUseCase;
  final DeleteCouponUseCase deleteCouponUseCase;
  final UpdateCouponUseCase editCouponUseCase;
  CouponsBloc(
    this.getCouponsUseCase,
    this.addCouponUseCase,
    this.deleteCouponUseCase,
    this.editCouponUseCase,
  ) : super(
          const CouponsState.initial(),
        ) {
    on<CouponsEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            final result = await getCouponsUseCase.getCoupons();
            await result.when(
              success: (coupons) async {
                await CouponsResponseModel().load(
                  coupons: coupons,
                );
                emit(
                  const CouponsState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CouponsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          add: (addCouponRequestModel) async {
            final result = await addCouponUseCase.addCoupon(
              addCouponRequestModel: addCouponRequestModel,
            );
            await result.when(
              success: (coupons) async {
                emit(
                  const CouponsState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CouponsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          edit: (updatedCoupon) async {
            final result = await editCouponUseCase.edit(
              coupon: updatedCoupon,
            );
            await result.when(
              success: (coupon) async {
                await CouponsResponseModel().replace(
                  coupon: coupon,
                );
                emit(
                  const CouponsState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CouponsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          delete: (id) async {
            final result = await deleteCouponUseCase.deleteCoupon(
              id: id,
            );
            await result.when(
              success: (_) async {
                CouponsResponseModel().coupons!.removeWhere(
                      (coupon) => coupon.id == id,
                    );
                emit(
                  const CouponsState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  CouponsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
