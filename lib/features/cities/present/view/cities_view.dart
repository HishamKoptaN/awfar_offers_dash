import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/singletons/cities_singleton.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_data_cell.dart';
import '../../../../core/widgets/custom_data_column.dart';
import '../../../../core/widgets/generic_table_view.dart';
import '../bloc/cities_bloc.dart';
import '../bloc/cities_event.dart';
import '../bloc/cities_state.dart';

class CitiesView extends StatelessWidget {
  const CitiesView({super.key});

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: false,
      backArow: false,
      route: 'المحافظات',
      body: Align(
        alignment: Alignment.topCenter,
        child: BlocProvider(
          create: (context) => CitiesBloc(
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
          child: BlocConsumer<CitiesBloc, CitiesState>(
            listener: (context, state) async {
              await state.whenOrNull(
                success: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("نجاح"),
                    ),
                  );
                },
                failure: (apiErrorModel) async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(apiErrorModel.error!),
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
                  return GenericTableView(
                    columns: [
                      customDataColumn(
                        label: 'معرف المدينة',
                      ),
                      customDataColumn(
                        label: 'الاسم',
                      ),
                      customDataColumn(
                        label: '',
                      ),
                      DataColumn(
                        label: CustomTextButtonWidget(
                          onPressed: () {
                            customNavigation(
                              context: context,
                              path: '/AddCityView',
                            );
                          },
                          text: 'أضافة مدينة',
                        ),
                      ),
                    ],
                    items: CitiesSingleton.instance.cities,
                    buildRow: (city) {
                      return DataRow(
                        cells: [
                          customDataCell(
                            label: city.name!,
                          ),
                          customDataCell(
                            label: city.name ?? 'لا يوجد اسم',
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: CustomTextButtonWidget(
                                onPressed: () {
                                  customNavigation(
                                    context: context,
                                    path: '/EditCityView',
                                    extra: city,
                                  );
                                },
                                text: 'تعديل',
                              ),
                            ),
                          ),
                          DataCell(
                            CustomTextButtonWidget(
                              widget: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 35.sp,
                              ),
                              onPressed: () {
                                if (!context.read<CitiesBloc>().isClosed) {
                                  context.read<CitiesBloc>().add(
                                        CitiesEvent.delete(
                                          id: city.id!,
                                        ),
                                      );
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
