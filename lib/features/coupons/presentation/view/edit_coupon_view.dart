import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_dropdown_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/singletons/stores_singleton.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../stores/data/models/store.dart';
import '../../data/models/coupon.dart';
import '../../data/models/update_coupon_request_model.dart';
import '../bloc/coupons_bloc.dart';
import '../bloc/coupons_event.dart';
import '../bloc/coupons_state.dart';

class EditCouponView extends StatefulWidget {
  EditCouponView({
    super.key,
    required this.coupon,
  });
  Coupon coupon;

  @override
  State<EditCouponView> createState() => _EditCouponViewState();
}

class _EditCouponViewState extends State<EditCouponView> {
  Store? selectedStore;
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'تعديل بيانات الكوبون',
      // onPressed: () {
      //   customNavigation(
      //     context: context,
      //     path: '/',
      //   );
      // },
      body: BlocConsumer<CouponsBloc, CouponsState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                snackBar(
                  status: true,
                  message: 'نجاح',
                ),
              );
            },
            failure: (apiErrorModel) async {
              ScaffoldMessenger.of(context).showSnackBar(
                snackBar(
                  status: false,
                  message: apiErrorModel.error!,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    initialValue: widget.coupon.description,
                    hintText: 'الوصف',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      EditCouponRequestModel().description = value;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextFormField(
                    initialValue: widget.coupon.code,
                    hintText: 'الكود',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      EditCouponRequestModel().code = value;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextFormField(
                    initialValue: widget.coupon.url,
                    hintText: 'الرابط',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      EditCouponRequestModel().url = value;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomDropdownContainer<Store>(
                    height: 75.h,
                    width: 450.w,
                    items: StoresSingleton.instance.stores,
                    selectedItem: selectedStore,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedStore = value;
                          EditCouponRequestModel().storeId = value!.id;
                        },
                      );
                    },
                    itemLabel: (item) => item.name ?? '',
                    fontSize: 20.sp,
                    hint: 'أختر المتجر صاحب الكوبون',
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextButtonWidget(
                    widget: state.maybeWhen(
                      loading: () {
                        return CustomCircularProgress();
                      },
                      orElse: () {
                        return CustomText(
                          text: "حفظ",
                          fontSize: 30.sp,
                          color: AppColors.white,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        );
                      },
                    ),
                    onPressed: () async {
                      final coupon = Coupon(
                        id: widget.coupon.id,
                        code: EditCouponRequestModel().code!,
                        description: EditCouponRequestModel().description!,
                        url: EditCouponRequestModel().url!,
                        storeId: EditCouponRequestModel().storeId!,
                      );
                      context.read<CouponsBloc>().add(
                            CouponsEvent.edit(
                              coupon: coupon,
                            ),
                          );
                    },
                  ),
                  Gap(
                    50.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
