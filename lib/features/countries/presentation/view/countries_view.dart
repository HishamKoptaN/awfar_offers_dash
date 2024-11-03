import 'package:awfar_offers_dash/features/countries/presentation/bloc/countries_bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/custom_button.dart';
import '../../../../core/global/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../data/models/countries_response_model.dart';
import '../bloc/countries_state.dart';

class CountriesView extends StatefulWidget {
  const CountriesView({
    super.key,
  });

  @override
  State<CountriesView> createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CountriesView> {
  @override
  Widget build(context) {
    final countries = CountriesResponseModel().countries ?? [];

    return MainLayout(
      showAppBar: false,
      route: 'الدول',
      body: BlocProvider(
        create: (context) => CountriesBloc(
          getIt(),
          getIt(),
          getIt(),
        ),
        child: BlocConsumer<CountriesBloc, CountriesState>(
          listener: (context, state) async {},
          builder: (context, state) {
            return state.maybeWhen(
              loading: () {
                return CustomCircularProgress();
              },
              orElse: () {
                return SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: CustomText(
                            text: 'معرف الدوله',
                            fontSize: 30.sp,
                          ),
                        ),
                        DataColumn(
                          label: CustomText(
                            text: 'الدوله',
                            fontSize: 30.sp,
                          ),
                        ),
                        DataColumn(
                          label: CustomTextButton(
                            text: "أضافة دولة",
                            onPressed: () {
                              customNavigation(
                                context: context,
                                path: '/AddCountryView',
                              );
                            },
                          ),
                        ),
                      ],
                      rows: countries.map(
                        (country) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  country.id.toString(),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: Container(
                                    height: 40.h,
                                    width: double.infinity,
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
                                      padding: const EdgeInsets.all(5),
                                      flagWidth: 60.w,
                                      textStyle: TextStyle(
                                        fontSize: 20.sp,
                                      ),
                                      enabled: false,
                                      onChanged: (c) => c.name,
                                      initialSelection: country.code,
                                      showCountryOnly: true,
                                      showOnlyCountryWhenClosed: true,
                                    ),
                                  ),
                                ),
                              ),
                              const DataCell(
                                SizedBox(),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    ),
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
