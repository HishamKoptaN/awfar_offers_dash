import 'package:awfar_offers_dash/features/countries/presentation/bloc/countries_bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/custom_data_cell.dart';
import '../../../../core/global/gobal_widgets/custom_data_column.dart';
import '../../../../core/global/gobal_widgets/snack_bar.dart';
import '../../data/models/countries_response_model.dart';
import '../bloc/countries_event.dart';
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
    return MainLayout(
      showAppBar: false,
      route: 'الدول',
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
                      customDataColumn(
                        label: 'معرف الدوله',
                      ),
                      customDataColumn(
                        label: 'الدوله',
                      ),
                      customDataColumn(
                        label: '',
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
                    rows: CountriesResponseModel().countries!.map(
                      (country) {
                        return DataRow(
                          cells: [
                            customDataCell(
                              label: country.id.toString(),
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
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: CustomTextButton(
                                  onPressed: () {
                                    customNavigation(
                                      context: context,
                                      path: '/EditCountryView',
                                      extra: country,
                                    );
                                  },
                                  text: 'تعديل',
                                ),
                              ),
                            ),
                            DataCell(
                              CustomTextButton(
                                widget: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 35.sp,
                                ),
                                onPressed: () {
                                  if (!context.read<CountriesBloc>().isClosed) {
                                    context.read<CountriesBloc>().add(
                                          CountriesEvent.delete(
                                            id: country.id!,
                                          ),
                                        );
                                  }
                                },
                              ),
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
    );
  }
}
