import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../data/models/governorates_response_model.dart';
import '../bloc/governorates_bloc.dart';
import '../bloc/governorates_state.dart';

class GovernoratesView extends StatelessWidget {
  const GovernoratesView({super.key});

  @override
  Widget build(context) {
    final governorates = GovernoratesResponseModel().governorates ?? [];

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
          ),
          child: BlocConsumer<GovernoratesBloc, GovernoratesState>(
            listener: (context, state) async {
              await state.whenOrNull(
                success: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "نجاح",
                      ),
                    ),
                  );
                },
                failure: (error) async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        error,
                      ),
                    ),
                  );
                  context.read<GovernoratesBloc>().emit(
                        GovernoratesState.governoratesLoaded(
                          governoratesResponseModel: governorates,
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
                          DataColumn(
                            label: CustomText(
                              text: 'معرف المحافظة',
                              fontSize: 30.sp,
                            ),
                          ),
                          DataColumn(
                            label: CustomText(
                              text: 'الاسم',
                              fontSize: 30.sp,
                            ),
                          ),
                          DataColumn(
                            label: CustomTextButton(
                              onPressed: () {
                                customNavigation(
                                  context: context,
                                  path: '/AddGovernorateView',
                                );
                              },
                              text: 'أضافة محافظة',
                            ),
                          ),
                        ],
                        rows: governorates.map(
                          (governorate) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(governorate.name!),
                                ),
                                DataCell(
                                  Text(
                                    governorate.name ?? 'لا يوجد اسم',
                                  ),
                                ),
                                const DataCell(
                                  SizedBox(),
                                ),
                                // DataCell(
                                //   CustomTextButton(
                                //     onPressed: () {
                                //       if (!context
                                //           .read<GovernoratesBloc>()
                                //           .isClosed) {
                                //         context.read<GovernoratesBloc>().add(
                                //               GovernoratesEvent
                                //                   .deleteGovernorates(
                                //                 id: governorate.id!,
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
                    ),
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
