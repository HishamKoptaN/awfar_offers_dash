import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/global/gobal_widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../countries/data/models/countries_response_model.dart';
import '../../../governorates/data/models/governorates_response_model.dart';
import '../../data/models/add_store_request_body_model.dart';
import '../bloc/stores_bloc.dart';
import '../bloc/stores_event.dart';
import '../bloc/stores_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddStoreView extends StatefulWidget {
  const AddStoreView({
    super.key,
  });

  @override
  State<AddStoreView> createState() => _AddStoreViewState();
}

class _AddStoreViewState extends State<AddStoreView> {
  File file = File("");
  Country? selectedCountry;
  Governorate? selectedGovernorate;
  AddStoreRequestBodyModel addStoreRequestBodyModel =
      AddStoreRequestBodyModel();
  final countries = CountriesResponseModel().countries;
  final governorates = GovernoratesResponseModel().governorates;

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة علامة تجارية',
      // onPressed: () {
      //   customNavigation(
      //     context: context,
      //     path: '/',
      //   );
      // },
      body: BlocProvider(
        create: (_) => StoresBloc(
          getIt(),
          getIt(),
        ),
        child: BlocConsumer<StoresBloc, StoresState>(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        hintText: 'اسم العلامه التجارية',
                        textInputType: TextInputType.text,
                        onChanged: (value) {
                          addStoreRequestBodyModel.name = value!;
                        },
                      ),
                      Gap(
                        10.h,
                      ),
                      CustomTextFormField(
                        hintText: 'العنوان',
                        textInputType: TextInputType.text,
                        onChanged: (value) {
                          addStoreRequestBodyModel.place = value!;
                        },
                      ),
                      Gap(
                        10.h,
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
                                addStoreRequestBodyModel.countryId =
                                    value!.id!.toString();
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
                      Container(
                        height: 75.h,
                        width: 450.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<Governorate>(
                          isExpanded: true,
                          value: selectedGovernorate,
                          onChanged: (value) {
                            setState(
                              () {
                                selectedGovernorate = value;
                                addStoreRequestBodyModel.governorateId =
                                    value!.id!.toString();
                              },
                            );
                          },
                          dropdownColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          items: governorates!.map(
                            (governorate) {
                              return DropdownMenuItem<Governorate>(
                                value: governorate,
                                child: Center(
                                  child: CustomText(
                                    text: governorate.name!,
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      Gap(10.h),
                      SizedBox(
                        height: 200.h,
                        width: 450.w,
                        child: InkWell(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              File file = File(result.files.single.path!);
                              await addStoreRequestBodyModel.setImageFile(
                                file,
                              );
                              setState(
                                () {
                                  this.file = file;
                                },
                              );
                            }
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: file.path.isEmpty
                                  ? const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.cloudArrowUp,
                                        ),
                                        Text(
                                          "أضف صورة المتجر",
                                        ),
                                        Gap(20),
                                      ],
                                    )
                                  : Image.file(
                                      file,
                                    )),
                        ),
                      ),
                      Gap(10.h),
                      CustomTextButton(
                        widget: state.maybeWhen(
                          loading: () {
                            return CustomCircularProgress();
                          },
                          orElse: () {
                            return CustomText(
                              text: 'أضافة',
                              fontSize: 30.sp,
                              maxLines: 1,
                              fontWeight: FontWeight.bold,
                            );
                          },
                        ),
                        onPressed: () async {
                          FormData formData = FormData.fromMap({
                            'name': addStoreRequestBodyModel.name,
                            'country_id': int.tryParse(
                                  addStoreRequestBodyModel.countryId ?? '',
                                ) ??
                                0,
                            'governorate_id': int.tryParse(
                                  addStoreRequestBodyModel.governorateId ?? '',
                                ) ??
                                0,
                            'place': addStoreRequestBodyModel.place,
                            'image': await MultipartFile.fromFile(
                              file.path,
                              filename: file.path.split('/').last,
                            ),
                          });
                          context.read<StoresBloc>().add(
                                StoresEvent.addEvent(
                                  formData: formData,
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
