import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/models/user.dart';
import '../../../../core/widgets/app_layout.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../bloc/users_bloc.dart';
import '../bloc/users_event.dart';
import '../bloc/users_state.dart';

class EditUserView extends StatefulWidget {
  EditUserView({
    super.key,
    required this.user,
  });
  User user;

  @override
  _EditUserViewState createState() => _EditUserViewState();
}

class _EditUserViewState extends State<EditUserView> {
  final List<bool> statuses = [true, false];
  final List<String> blockUnblocked = ['active', 'inactive'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      route: 'تعديل بيانات المستخدم',
      showAppBar: true,
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
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  ToastNotifier().showSuccess(
                    context: context,
                    message: "نجاح",
                  );
                },
                failure: (apiErrorModel) {
                  ToastNotifier().showFailure(
                    context: context,
                    message: apiErrorModel.error!,
                  );
                },
              );
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // SizedBox(
                      //   height: 100.h,
                      //   width: 450.w,
                      //   child: GridView.builder(
                      //     gridDelegate:
                      //         const SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 4,
                      //       crossAxisSpacing: 10.0,
                      //       mainAxisSpacing: 10.0,
                      //       mainAxisExtent: 40,
                      //     ),
                      //     itemCount: RolesSingleton.instance.roles.length,
                      //     itemBuilder: (context, index) {
                      //       final role = RolesSingleton.instance.roles[index];
                      //       final isSelected = widget.user.roles!.any(
                      //         (userRole) => userRole.id == role.id,
                      //       );
                      //       return Row(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           Checkbox(
                      //             value: isSelected,
                      //             onChanged: (bool? value) {
                      //               setState(
                      //                 () {
                      //                   if (value == true) {
                      //                     widget.user = widget.user.copyWith(
                      //                       roles: List.from(
                      //                           widget.user.roles ?? [])
                      //                         ..add(role),
                      //                     );
                      //                   } else {
                      //                     widget.user = widget.user.copyWith(
                      //                       roles: List.from(
                      //                           widget.user.roles ?? [])
                      //                         ..removeWhere(
                      //                           (userRole) =>
                      //                               userRole.id == role.id,
                      //                         ),
                      //                     );
                      //                   }
                      //                 },
                      //               );
                      //             },
                      //           ),
                      //           Expanded(
                      //             child: CustomText(
                      //               text: role.name ?? 'No Name',
                      //               fontSize: 15.sp,
                      //               color: Colors.black,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   ),
                      // ),
                      // Container(
                      //   height: 50.h,
                      //   width: 450.w,
                      //   decoration: BoxDecoration(border: Border.all()),
                      //   child: TextButton(
                      //     onPressed: () async {
                      //       // statusController.text == "active"
                      //       //     ? await showDialog(
                      //       //         context: context,
                      //       //         builder: (context) {
                      //       //           return BlockUserDialog(
                      //       //             blockTypeController: blockTypeController,
                      //       //             blockTimeController: blockTimeController,
                      //       //             onPressed: () {
                      //       //               setState(() {
                      //       //                 statusController.text = "inactive";
                      //       //               });
                      //       //               Navigator.pop(context);
                      //       //             },
                      //       //           );
                      //       //         },
                      //       //       )
                      //       //     : await showDialog(
                      //       //         context: context,
                      //       //         builder: (context) {
                      //       //           return UnblockUserDialog(
                      //       //             onPressed: () async {
                      //       //               setState(() {
                      //       //                 statusController.text = "active";
                      //       //               });
                      //       //               Navigator.pop(context);
                      //       //             },
                      //       //           );
                      //       //         },
                      //       //       );
                      //     },
                      //     child: CustomText(
                      //       text: widget.user.status == true
                      //           ? 'Block User'
                      //           : 'is Blocked',
                      //       color: widget.user.status == true
                      //           ? Colors.black
                      //           : Colors.red,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 20.sp,
                      //     ),
                      //   ),
                      // ),
                      Gap(
                        10.h,
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 450.w,
                        child: DropdownButtonFormField<bool>(
                          value: widget.user.status,
                          onChanged: (bool? value) {
                            setState(
                              () {
                                widget.user = widget.user.copyWith(
                                  status: !value!,
                                );
                              },
                            );
                          },
                          decoration: const InputDecoration(
                            labelText: 'حالة المستخدم',
                            border: OutlineInputBorder(),
                          ),
                          items: statuses.map<DropdownMenuItem<bool>>(
                            (bool value) {
                              return DropdownMenuItem<bool>(
                                value: value,
                                child: CustomText(
                                  text: value ? 'Blocked' : 'Active',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      CustomTextFormField(
                        label: 'الاسم',
                        initialValue: widget.user.firstName,
                        textInputType: TextInputType.text,
                        enabled: false,
                        onChanged: (value) {},
                      ),
                      CustomTextFormField(
                        label: 'الاسم الاخير',
                        initialValue: widget.user.lastName,
                        textInputType: TextInputType.text,
                        enabled: false,
                        onChanged: (value) {},
                      ),
                      CustomTextFormField(
                        label: 'الايميل',
                        initialValue: widget.user.email,
                        textInputType: TextInputType.number,
                        onChanged: (value) {
                          widget.user = widget.user.copyWith(
                            email: value!,
                          );
                        },
                        enabled: false,
                      ),

                      CustomTextFormField(
                        label: 'رقم الموبيل',
                        initialValue: widget.user.phone,
                        enabled: false,
                        onChanged: (value) {},
                      ),
                      CustomTextFormField(
                        label: 'العنوان',
                        initialValue: widget.user.address,
                        enabled: false,
                      ),
                      CustomTextFormField(
                        label: 'أنشئ في',
                        initialValue: widget.user.createdAt,
                        textInputType: TextInputType.number,
                        enabled: false,
                      ),

                      Gap(
                        10.h,
                      ),
                      CustomTextButtonWidget(
                        // width: 250.w,
                        widget: state.maybeWhen(
                          loading: () {
                            return CustomCircularProgress();
                          },
                          orElse: () {
                            return CustomText(
                              text: "حفظ",
                              fontSize: 15.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            );
                          },
                        ),
                        onPressed: () {
                          context.read<UsersBloc>().add(
                                UsersEvent.edit(
                                  user: widget.user,
                                ),
                              );
                        },
                      ),
                      Gap(
                        25.h,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class BlockUserDialog extends StatefulWidget {
  TextEditingController blockTypeController;
  TextEditingController blockTimeController;
  void Function()? onPressed;

  BlockUserDialog({
    super.key,
    required this.blockTypeController,
    required this.blockTimeController,
    required this.onPressed,
  });

  @override
  _BlockUserDialogState createState() => _BlockUserDialogState();
}

class _BlockUserDialogState extends State<BlockUserDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> blockTypes = ['temporary', 'permanent'];

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Center(
        child: Text(
          "Block User",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 125.w,
            height: 50.h,
            child: DropdownButtonFormField<String>(
              value: widget.blockTypeController.text.isEmpty
                  ? null
                  : widget.blockTypeController.text,
              onChanged: (String? newValue) {
                setState(() {
                  widget.blockTypeController.text = newValue ?? '';
                });
              },
              decoration: const InputDecoration(
                labelText: 'Block Type',
                border: OutlineInputBorder(),
              ),
              items: blockTypes.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
          ),
          // widget.blockTypeController.text == "temporary"
          //     ? SizedBox(
          //         width: 125.w,
          //         height: 50.h,
          //         child: MyTextInput(
          //           textEditingController: widget.blockTimeController,
          //           label: 'Block Time',
          //           isNumeric: true,
          //           enabled: true,
          //         ),
          //       )
          //     : const SizedBox(),
          const Text(
            'Are you sure?',
            textAlign: TextAlign.center,
          ),
          Gap(20.h),
          const Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: widget.onPressed,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class UnblockUserDialog extends StatelessWidget {
//   void Function()? onPressed;

//   UnblockUserDialog({super.key, required this.onPressed});
//   SideMenuController sideMenu = SideMenuController();

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       title: const Center(
//         child: Text(
//           "UnBlock User",
//           style: TextStyle(
//             color: Colors.blue,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text(
//             'Are you sure to un block user?',
//             textAlign: TextAlign.center,
//           ),
//           Gap(20.h),
//           const Divider(thickness: 1),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 child: TextButton(
//                   onPressed: onPressed,
//                   child: const Text(
//                     'Submit',
//                     style: TextStyle(
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 40,
//                 width: 1,
//                 color: Colors.grey,
//               ),
//               Expanded(
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text(
//                     'Close',
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
