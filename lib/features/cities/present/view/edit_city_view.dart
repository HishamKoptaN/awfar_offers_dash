import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/singletons/countries_singleton.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../countries/data/models/countries_res_model.dart';
import '../../data/models/edit_city_request_model.dart';
import '../../data/models/cities_res_model.dart';
import '../bloc/cities_bloc.dart';
import '../bloc/cities_event.dart';
import '../bloc/cities_state.dart';

class EditCityView extends StatefulWidget {
  EditCityView({
    super.key,
    required this.governorate,
  });
  City governorate;
  @override
  State<EditCityView> createState() => _EditCityViewState();
}

Country? selectedCountry;
EditCityReqModel editCityReqModel = EditCityReqModel();

class _EditCityViewState extends State<EditCityView> {
  @override
  void initState() {
    super.initState();
    EditCityReqModel().id = widget.governorate.id;
    EditCityReqModel().name = widget.governorate.name;
    EditCityReqModel().countryId = widget.governorate.countryId;
    selectedCountry = CountriesSingleton.instance.countries.firstWhere(
      (country) => country.id == widget.governorate.countryId,
      orElse: () => CountriesSingleton.instance.countries.first,
    );
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'تعديل بيانات المدينة',
      // onPressed: () {
      //   customNavigation(
      //     context: context,
      //     path: '/',
      //   );
      // },
      body: BlocProvider(
        create: (_) => getIt<CitiesBloc>(),
        child: BlocConsumer<CitiesBloc, CitiesState>(
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
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      label: 'اسم المدينة',
                      initialValue: widget.governorate.name,
                      textInputType: TextInputType.text,
                      onChanged: (value) {
                        editCityReqModel.name = value;
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
                              editCityReqModel.countryId = value!.id!;
                            },
                          );
                        },
                        items: CountriesSingleton.instance.countries.map(
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
                                    replacement: Text(
                                      country.code ?? 'أختر الدوله',
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
                        context.read<CitiesBloc>().add(
                              CitiesEvent.edit(
                                editCityReqModel: editCityReqModel,
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
      ),
    );
  }
}
