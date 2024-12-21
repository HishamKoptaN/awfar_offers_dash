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
import '../../data/models/add_governorate_request_model.dart';
import '../bloc/governorates_bloc.dart';
import '../bloc/governorates_event.dart';
import '../bloc/governorates_state.dart';

class AddGovernorateView extends StatefulWidget {
  const AddGovernorateView({
    super.key,
  });

  @override
  State<AddGovernorateView> createState() => _AddGovernorateViewState();
}

Country? selectedCountry;
AddGovernorateRequestModel addGovernorateRequestModel =
    AddGovernorateRequestModel();
final countries = CountriesSingleton.instance.countries;

class _AddGovernorateViewState extends State<AddGovernorateView> {
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة مدينة',
      body: BlocProvider(
        create: (_) => getIt<GovernoratesBloc>(),
        child: BlocConsumer<GovernoratesBloc, GovernoratesState>(
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
                      hintText: 'اسم المدينة',
                      textInputType: TextInputType.text,
                      onChanged: (value) {
                        addGovernorateRequestModel.name = value;
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
                              addGovernorateRequestModel.countryId = value!.id!;
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
                            text: "اضافة",
                            fontSize: 30.sp,
                            color: AppColors.white,
                            maxLines: 1,
                            fontWeight: FontWeight.bold,
                          );
                        },
                      ),
                      onPressed: () async {
                        context.read<GovernoratesBloc>().add(
                              GovernoratesEvent.add(
                                addGovernorateRequestModel:
                                    addGovernorateRequestModel,
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
