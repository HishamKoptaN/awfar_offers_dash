import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/custom_button.dart';
import '../../../../core/global/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../data/models/stores_response_model.dart';
import '../bloc/stores_bloc.dart';
import '../bloc/stores_event.dart';
import '../bloc/stores_state.dart';

class StoresView extends StatelessWidget {
  const StoresView({
    super.key,
  });

  @override
  Widget build(
    context,
  ) {
    final stores = StoresResponseModel().stores ?? [];
    return MainLayout(
      showAppBar: false,
      backArow: false,
      route: '',
      body: Center(
        child: BlocProvider(
          create: (context) => StoresBloc(
            getIt(),
            getIt(),
          ),
          child: BlocListener<StoresBloc, StoresState>(
            listener: (context, state) async {
              state.whenOrNull(
                failure: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        error.error!,
                      ),
                    ),
                  );
                },
              );
            },
            child: BlocBuilder<StoresBloc, StoresState>(
              builder: (context, state) {
                state.whenOrNull(
                  initial: () {
                    context.read<StoresBloc>().add(
                          const StoresEvent.getEvent(),
                        );
                  },
                );
                return state.maybeWhen(
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
                                text: 'الاسم',
                                fontSize: 30.sp,
                              ),
                            ),
                            DataColumn(
                              label: CustomTextButton(
                                onPressed: () {
                                  customNavigation(
                                    context: context,
                                    path: '/AddStoreView',
                                  );
                                },
                                text: 'أضافة متجر',
                              ),
                            ),
                          ],
                          rows: stores.map(
                            (store) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      store.id.toString(),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      store.name!,
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
                  loading: () => CustomCircularProgress(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
