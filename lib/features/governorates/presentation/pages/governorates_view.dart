import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/circular_progress.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../countries/data/models/countries_response_model.dart';
import '../../data/models/governorates_response_model.dart';
import '../bloc/governorates_bloc.dart';
import '../bloc/governorates_event.dart';
import '../bloc/governorates_state.dart';

class GovernoratesView extends StatefulWidget {
  const GovernoratesView({super.key});

  @override
  State<GovernoratesView> createState() => _GovernoratesViewState();
}

final governorates = GovernoratesResponseModel().governorates;

class _GovernoratesViewState extends State<GovernoratesView> {
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      backArow: false,
      route: 'المحافظات',
      body: Align(
        alignment: Alignment.topCenter,
        child: BlocProvider(
          create: (context) => getIt<GovernoratesBloc>(),
          child: BlocConsumer<GovernoratesBloc, GovernoratesState>(
            listener: (context, state) async {
              await state.whenOrNull(
                success: (governoratesResponseModel) async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "نجاح",
                      ),
                    ),
                  );
                  context.read<GovernoratesBloc>().emit(
                        GovernoratesState.governoratesLoaded(
                          governoratesResponseModel: governoratesResponseModel,
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
              state.whenOrNull(
                initial: () {
                  context.read<GovernoratesBloc>().add(
                        const GovernoratesEvent.getGovernorate(),
                      );
                },
              );
              return state.maybeWhen(
                governoratesLoaded: (governorates) {
                  if (governorates == null ||
                      governorates == null ||
                      governorates.isEmpty) {
                    return const Center(
                      child: Text('لا توجد محافظات متاحة.'),
                    );
                  }
                  return SingleChildScrollView(
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
                              DataCell(
                                CustomTextButton(
                                  onPressed: () {
                                    if (!context
                                        .read<GovernoratesBloc>()
                                        .isClosed) {
                                      context.read<GovernoratesBloc>().add(
                                            GovernoratesEvent
                                                .deleteGovernorates(
                                              id: governorate.id!,
                                            ),
                                          );
                                    }
                                  },
                                  text: 'حذف',
                                ),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                  );
                },
                orElse: () => const CustomCircularProgress(),
              );
            },
          ),
        ),
      ),
    );
  }
}
