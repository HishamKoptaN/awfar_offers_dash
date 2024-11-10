import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/custom_dropdown_button.dart';
import '../../../../core/global/gobal_widgets/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/global/gobal_widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../countries/data/models/countries_response_model.dart';
import '../../../stores/data/models/stores_response_model.dart';
import '../../data/models/add_coupon_request_model.dart';
import '../bloc/coupons_bloc.dart';
import '../bloc/coupons_event.dart';
import '../bloc/coupons_state.dart';

class AddCouponView extends StatefulWidget {
  const AddCouponView({
    super.key,
  });

  @override
  State<AddCouponView> createState() => _AddCouponViewState();
}

class _AddCouponViewState extends State<AddCouponView> {
  Store? selectedCountry;
  AddCouponRequestModel addCouponRequestModel = AddCouponRequestModel();
  Store? selectedStore;
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة كوبون خصم',
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
                  Gap(
                    10.h,
                  ),
                  CustomDropdownContainer<Store>(
                    height: 75.h,
                    width: 450.w,
                    items: StoresResponseModel().stores!,
                    selectedItem: selectedStore,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedStore = value;
                          addCouponRequestModel.storeId = value!.id.toString();
                        },
                      );
                    },
                    itemLabel: (item) => item.name,
                    fontSize: 20.sp,
                    hint: 'أختر المتجر صاحب الكوبون',
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextFormField(
                    hintText: 'الوصف',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      addCouponRequestModel.description = value;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextFormField(
                    hintText: 'الكود',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      addCouponRequestModel.code = value;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextFormField(
                    hintText: 'الرابط',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      addCouponRequestModel.url = value;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextButton(
                    widget: state.maybeWhen(
                      loading: () {
                        return CustomCircularProgress();
                      },
                      orElse: () {
                        return CustomText(
                          text: "اضافة",
                          fontSize: 30.sp,
                          color: AppColors.white,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        );
                      },
                    ),
                    onPressed: () async {
                      context.read<CouponsBloc>().add(
                            CouponsEvent.add(
                              addCouponRequestModel: addCouponRequestModel,
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
