import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/circular_progress.dart';
import '../../../../core/global/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../countries/data/models/countries_response_model.dart';
import '../../../governorates/data/models/governorates_response_model.dart';
import '../../data/models/add_store_request_body_model.dart';
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
        create: (_) => getIt<StoresBloc>(),
        child: BlocConsumer<StoresBloc, StoresState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (storesResponseModel) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "نجاح",
                    ),
                  ),
                );
                customNavigation(
                  context: context,
                  path: '/storesView',
                );
              },
              failure: (error) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      error.error!,
                    ),
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () {
                return const CustomCircularProgress();
              },
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
                      Gap(
                        10.h,
                      ),
                      CustomTextButton(
                        text: 'أضافة',
                        onPressed: () async {
                          context.read<StoresBloc>().add(
                                const StoresEvent.addEvent(
                                    // addStoreRequestModel: addStoreRequestModel,
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
