import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/singletons/roles_singleton.dart';
import '../../../../core/widgets/app_layout.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_data_cell.dart';
import '../../../../core/widgets/custom_data_column.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/generic_table_view.dart';
import '../bloc/roles_bloc.dart';
import '../bloc/roles_event.dart';
import '../bloc/roles_state.dart';
import 'add_role_view.dart';
import 'edit_role_view.dart';

class RolesView extends StatelessWidget {
  const RolesView({super.key});

  @override
  Widget build(context) {
    return AppLayout(
      showAppBar: false,
      body: BlocProvider(
        create: (_) => RolesBloc(
          getRolesUseCase: getIt(),
          editRolesUseCase: getIt(),
          addRoleUseCase: getIt(),
        )..add(
            const RolesEvent.get(),
          ),
        child: BlocConsumer<RolesBloc, RolesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.maybeWhen(
              loaded: () {
                return GenericTableView(
                  columns: [
                    customDataColumn(
                      label: 'الاسم',
                    ),
                    customDataColumn(
                      label: 'الاذونات',
                    ),
                    // DataColumn(
                    //   label: CustomTextButtonWidget(
                    //     // width: 125.w,
                    //     text: "أضافة دور",
                    //     onPressed: () {
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //           builder: (context) {
                    //             return CreateRoleView();
                    //           },
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                  items: RolesSingleton.instance.roles,
                  buildRow: (role) {
                    return DataRow(
                      cells: [
                        customDataCell(label: role.name!),
                        customDataCell(
                          label: role.permissions!
                              .map((permission) => permission.name)
                              .join(', '),
                        ),
                        // DataCell(
                        //   Row(
                        //     children: [
                        //       CustomTextButtonWidget(
                        //         // width: 125.w,
                        //         onPressed: () {
                        //           Navigator.of(context).push(
                        //             MaterialPageRoute(
                        //               builder: (context) => EditRoleView(
                        //                 role: role,
                        //               ),
                        //             ),
                        //           );
                        //         },
                        //         text: 'تعديل',
                        //       ),
                        //       // CustomButtonWidget(
                        //       //   width: 125.w,
                        //       //   onPressed: () {
                        //       //     Navigator.of(context).push(
                        //       //       MaterialPageRoute(
                        //       //         builder: (context) => RoleDetailsView(
                        //       //           role: role,
                        //       //         ),
                        //       //       ),
                        //       //     );
                        //       //   },
                        //       //   text: 'عرض',
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    );
                  },
                );
              },
              orElse: () {
                return Center(
                  child: CustomCircularProgress(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
