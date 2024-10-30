import 'package:awfar_offers_dash/features/countries/presentation/bloc/countries_bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
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
  bool loading = false;
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: false,
      route: 'الدول',
      body: BlocProvider(
        create: (context) => getIt<CountriesBloc>(),
        child: BlocConsumer<CountriesBloc, CountriesState>(
          listener: (context, state) async {
            await state.whenOrNull(
              success: (countriesResponseModel) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "success",
                    ),
                  ),
                );
                context.read<CountriesBloc>().emit(
                      CountriesState.countriesLoaded(
                        countriesResponseModel: countriesResponseModel,
                      ),
                    );
                loading = false;
              },
              failure: (error) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      error,
                    ),
                  ),
                );
                // context.read<CountriesBloc>().emit(
                //        const CountriesState.countriesLoaded(
                //         countriesResponseModel:  const CountriesResponseModel(),
                //       ),
                //     );
                loading = false;
              },
            );
          },
          builder: (context, state) {
            state.whenOrNull(
              initial: () {
                context.read<CountriesBloc>().add(
                      const CountriesEvent.getCountries(),
                    );
              },
            );
            return Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  state.maybeWhen(
                    countriesLoaded: (countriesResponseModel) {
                      return SingleChildScrollView(
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
                                onPressed: () {
                                  customNavigation(
                                    context: context,
                                    path: '/AddCountryView',
                                  );
                                },
                                text: 'أضافة دولة',
                              ),
                            ),
                          ],
                          rows: countriesResponseModel!.map(
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
                                        width: 350.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
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
                                  // DataCell(
                                  //   CustomTextButton(
                                  //     onPressed: () {
                                  //       loading = true;
                                  //       setState(() {});
                                  //       if (!context
                                  //           .read<CountriesBloc>()
                                  //           .isClosed) {
                                  //         context.read<CountriesBloc>().add(
                                  //               CountriesEvent.deleteCountries(
                                  //                 id: country.id!,
                                  //               ),
                                  //             );
                                  //       }
                                  //     },
                                  //     text: 'حذف',
                                  //   ),
                                  // ),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      );
                    },
                    orElse: () => Container(),
                  ),
                  loading
                      ? Positioned.fill(
                          child: Container(
                            color: Colors.black54,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
