import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/singletons/governoarates_singleton.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_data_cell.dart';
import '../../../../core/widgets/custom_data_column.dart';
import '../../../../core/widgets/generic_table_view.dart';
import '../../data/models/governorates_response_model.dart';
import '../bloc/governorates_bloc.dart';
import '../bloc/governorates_event.dart';
import '../bloc/governorates_state.dart';

class GovernoratesView extends StatelessWidget {
  const GovernoratesView({super.key});

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: false,
      backArow: false,
      route: 'المحافظات',
      body: Align(
        alignment: Alignment.topCenter,
        child: BlocProvider(
          create: (context) => GovernoratesBloc(
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
          child: BlocConsumer<GovernoratesBloc, GovernoratesState>(
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
                              path: '/AddGovernorateView',
                            );
                          },
                          text: 'أضافة مدينة',
                        ),
                      ),
                    ],
                    items: GovernoratesSingleton.instance.governorates,
                    buildRow: (governorate) {
                      return DataRow(
                        cells: [
                          customDataCell(
                            label: governorate.name!,
                          ),
                          customDataCell(
                            label: governorate.name ?? 'لا يوجد اسم',
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: CustomTextButtonWidget(
                                onPressed: () {
                                  customNavigation(
                                    context: context,
                                    path: '/EditGovernorateView',
                                    extra: governorate,
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
                                if (!context
                                    .read<GovernoratesBloc>()
                                    .isClosed) {
                                  context.read<GovernoratesBloc>().add(
                                        GovernoratesEvent.delete(
                                          id: governorate.id!,
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
