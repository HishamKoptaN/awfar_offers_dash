import 'dart:typed_data';
import 'package:awfar_offers_dash/core/widgets/pick_image_widget.dart';
import 'package:awfar_offers_dash/features/governorates/presentation/pages/add_governorate_view.dart';
import 'package:dio/dio.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/singletons/governoarates_singleton.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_dropdown_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../countries/data/models/countries_res_model.dart';
import '../../../governorates/data/models/governorates_response_model.dart';
import '../bloc/stores_bloc.dart';
import '../bloc/stores_event.dart';
import '../bloc/stores_state.dart';

class AddStoreView extends StatefulWidget {
  const AddStoreView({
    super.key,
  });
  @override
  State<AddStoreView> createState() => _AddStoreViewState();
}

class _AddStoreViewState extends State<AddStoreView> {
  String? name;
  String? place;
  Governorate? selectedGovernorate;
  Uint8List? image;
  final governorates = GovernoratesSingleton.instance.governorates;
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة  متجر',
      body: BlocConsumer<StoresBloc, StoresState>(
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
            failure: (error) async {
              ScaffoldMessenger.of(context).showSnackBar(
                snackBar(
                  status: false,
                  message: error.error!,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        hintText: 'اسم العلامه التجارية',
                        textInputType: TextInputType.text,
                        onChanged: (v) {
                          name = v;
                        },
                      ),
                      Gap(
                        10.h,
                      ),
                      CustomTextFormField(
                        hintText: 'العنوان',
                        textInputType: TextInputType.text,
                        onChanged: (v) {
                          place = v;
                        },
                      ),
                      Container(
                        height: 75.h,
                        width: 450.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<Country>(
                          isExpanded: true,
                          value: selectedCountry,
                          onChanged: (value) {
                            setState(
                              () {
                                selectedCountry = value;
                                selectedGovernorate = null;
                              },
                            );
                          },
                          items: countries!.map(
                            (country) {
                              return DropdownMenuItem<Country>(
                                value: country,
                                child: Center(
                                  child: Flag.fromString(
                                    country.code!,
                                    height: 50.h,
                                    width: 100.w,
                                    fit: BoxFit.fill,
                                    replacement: Flag.fromString(
                                      country.code!,
                                      height: 50.h,
                                      width: 100.w,
                                      fit: BoxFit.fill,
                                      replacement: CustomText(
                                        text: country.code ?? 'أختر الدوله',
                                        fontSize: 20.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      Gap(
                        10.h,
                      ),
                      CustomDropdownContainer<Governorate>(
                        height: 75.h,
                        width: 450.w,
                        items: governorates!
                            .where(
                              (governorate) =>
                                  governorate.countryId == selectedCountry?.id,
                            )
                            .toList(),
                        selectedItem: selectedGovernorate,
                        onChanged: (value) {
                          setState(
                            () {
                              selectedGovernorate = value;
                            },
                          );
                        },
                        itemLabel: (item) => item.name!,
                        fontSize: 20.sp,
                        hint: 'أختر المدينة',
                      ),
                      Gap(
                        10.h,
                      ),
                      PickImageWidget(
                        label: "أضف صورة المتجر",
                        onImagePicked: (imageBytes) {
                          if (imageBytes != null) {
                            image = imageBytes;
                          }
                        },
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
                              text: 'أضافة',
                              fontSize: 30.sp,
                              maxLines: 1,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            );
                          },
                        ),
                        onPressed: () async {
                          FormData formData = FormData.fromMap(
                            {
                              'name': name,
                              'governorate_id': selectedGovernorate?.id,
                              'place': place,
                              'image': MultipartFile.fromBytes(
                                image!,
                                filename: 'offer_image.jpg',
                              ),
                            },
                          );
                          context.read<StoresBloc>().add(
                                StoresEvent.add(
                                  formData: formData,
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
          );
        },
      ),
    );
  }
}
