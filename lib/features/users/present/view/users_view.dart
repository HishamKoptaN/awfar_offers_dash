import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/singletons/users_singletone.dart';
import '../../../../core/widgets/app_layout.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_data_cell.dart';
import '../../../../core/widgets/custom_data_column.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/generic_table_view.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../bloc/users_bloc.dart';
import '../bloc/users_event.dart';
import '../bloc/users_state.dart';
import 'edit_user.dart';
import 'user_details.dart';

class UsersView extends StatefulWidget {
  const UsersView({
    super.key,
  });
  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  List<int> selectedUserIds = [];
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      route: '',
      showAppBar: false,
      body: Center(
        child: BlocProvider(
          create: (_) => UsersBloc(
            getUsersUseCase: getIt(),
            editUsersUseCase: getIt(),
            addUserUseCase: getIt(),
            notifyUseCase: getIt(),
          )..add(
              const UsersEvent.get(),
            ),
          child: BlocConsumer<UsersBloc, UsersState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state.maybeWhen(
                loaded: () {
                  return GenericTableView(
                    columns: [
                      // customDataColumn(
                      //   label: 'تحديد',
                      // ),
                      customDataColumn(
                        label: 'معرف المستخدم',
                      ),
                      customDataColumn(
                        label: 'الاسم',
                      ),
                      customDataColumn(
                        label: 'الايميل',
                      ),
                      // customDataColumn(
                      //   label: '',
                      // ),
                      // DataColumn(
                      //   label:
                      // CustomButtonWidget(
                      //   width: 100.w,
                      //   widget: state.maybeWhen(
                      //     loading: () {
                      //       return const CustomCircularProgress();
                      //     },
                      //     orElse: () {
                      //       return CustomText(
                      //         text: "تعديل",
                      //         fontSize: 15.sp,
                      //         color: Colors.blue,
                      //         fontWeight: FontWeight.bold,
                      //       );
                      //     },
                      //   ),
                      //   onPressed: () {
                      //     Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return const CreateUserView();
                      //     },
                      //   ),
                      // );
                      //   },
                      // ),
                    ],
                    items: UsersSingleton.instance.users!,
                    buildRow: (user) {
                      final isSelected = selectedUserIds.contains(
                        user.id,
                      );
                      return DataRow(
                        cells: [
                          // DataCell(
                          //   Checkbox(
                          //     value: isSelected,
                          //     onChanged: (bool? value) {
                          //       if (value != null) {
                          //         isSelected
                          //             ? selectedUserIds.remove(
                          //                 user.id!,
                          //               )
                          //             : selectedUserIds.add(
                          //                 user.id!,
                          //               );
                          //         setState(() {});
                          //       }
                          //     },
                          //   ),
                          // ),
                          customDataCell(
                            label: user.id.toString(),
                          ),
                          customDataCell(
                            label: user.firstName.toString(),
                          ),
                          customDataCell(
                            label: user.email.toString(),
                          ),

                          // DataCell(
                          //   Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     children: <Widget>[
                          //       CustomTextButtonWidget(
                          //         // width: 125.w,
                          //         onPressed: () {
                          //           Navigator.of(context).push(
                          //             MaterialPageRoute(
                          //               builder: (context) => UserDetailsView(
                          //                 user: user,
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //         text: 'عرض',
                          //       ),
                          //       CustomTextButtonWidget(
                          //         // width: 100.w,
                          //         widget: state.maybeWhen(
                          //           loading: () {
                          //             return CustomCircularProgress();
                          //           },
                          //           orElse: () {
                          //             return CustomText(
                          //               text: "تعديل",
                          //               fontSize: 15.sp,
                          //               color: Colors.blue,
                          //               fontWeight: FontWeight.bold,
                          //             );
                          //           },
                          //         ),
                          //         onPressed: () {
                          //           Navigator.of(context).push(
                          //             MaterialPageRoute(
                          //               builder: (context) => EditUserView(
                          //                 user: user,
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      );
                    },
                  );
                },
                orElse: () {
                  return CustomCircularProgress();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
