import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
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
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة دولة',
      onPressed: () {
        customNavigation(
          context: context,
          path: '/CountriesView',
        );
      },
      body: BlocProvider(
        create: (_) => getIt<CountriesBloc>(),
        child: BlocConsumer<CountriesBloc, CountriesState>(
          listener: (context, state) {
            state.whenOrNull();
          },
          builder: (context, state) {
            return Center(
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
                      text: 'أضافة',
                      onPressed: () async {
                        if (selectedCountryCode != null) {
                          context.read<CountriesBloc>().add(
                                CountriesEvent.addCountryEvent(
                                  addCountryRequestModel:
                                      AddCountryRequestModel(
                                    code: selectedCountryCode!,
                                  ),
                                ),
                              );
                        }
                      },
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
