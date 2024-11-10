import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/global/gobal_widgets/snack_bar.dart';
import '../../data/models/add_country_request_body_model.dart';
import '../bloc/countries_bloc.dart';
import '../bloc/countries_event.dart';
import '../bloc/countries_state.dart';

class AddCountryView extends StatefulWidget {
  const AddCountryView({super.key});

  @override
  State<AddCountryView> createState() => _AddCountryViewState();
}

String? selectedCountryCode;

class _AddCountryViewState extends State<AddCountryView> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة دولة',
      onPressed: () {
        customNavigation(
          context: context,
          path: '/CountriesView',
        );
      },
      body: BlocConsumer<CountriesBloc, CountriesState>(
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
                  message: error,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'اختر دولة',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[800],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 300.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: CountryCodePicker(
                            onChanged: (countryCode) {
                              selectedCountryCode = countryCode.code;
                              AddCountryRequestBodyModel().code =
                                  countryCode.code;
                            },
                            initialSelection: 'EG',
                            favorite: const ['EG'],
                            showCountryOnly: true,
                            showOnlyCountryWhenClosed: false,
                            showFlag: true,
                            alignLeft: false,
                            showFlagMain: true,
                            textStyle: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              );
                            },
                          ),
                          onPressed: () async {
                            if (selectedCountryCode != null) {
                              context.read<CountriesBloc>().add(
                                    CountriesEvent.add(
                                      addCountryRequestBodyModel:
                                          AddCountryRequestBodyModel(),
                                    ),
                                  );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
