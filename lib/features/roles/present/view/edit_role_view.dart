import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/models/role.dart';
import '../../../../core/singletons/permissions_singleton.dart';
import '../../../../core/widgets/app_layout.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../../../permissions/present/bloc/permissions_bloc.dart';
import '../../../permissions/present/bloc/permissions_state.dart';
import '../bloc/roles_bloc.dart';
import '../bloc/roles_event.dart';
import '../bloc/roles_state.dart';

class EditRoleView extends StatefulWidget {
  @override
  _EditRoleViewState createState() => _EditRoleViewState();
  Role role;
  EditRoleView({
    super.key,
    required this.role,
  });
}

class _EditRoleViewState extends State<EditRoleView> {
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
      route: 'Edit Role',
      showAppBar: true,
      body: BlocProvider(
        create: (_) => RolesBloc(
          getRolesUseCase: getIt(),
          editRolesUseCase: getIt(),
          addRoleUseCase: getIt(),
        ),
        child: BlocConsumer<RolesBloc, RolesState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ToastNotifier().showSuccess(
                  context: context,
                  message: "نجاح",
                );
              },
              failure: (a) {
                ToastNotifier().showFailure(
                  context: context,
                  message: "فشل",
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
                    CustomTextFormField(
                      label: 'الاسم',
                      enabled: true,
                      initialValue: widget.role.name,
                      textInputType: TextInputType.text,
                      onChanged: (value) {
                        widget.role = widget.role.copyWith(
                          name: value,
                        );
                      },
                    ),
                    Gap(
                      25.h,
                    ),
                    SizedBox(
                      height: 250.h,
                      width: 600.w,
                      child: BlocBuilder<PermissionsBloc, PermissionsState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loaded: () {
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  mainAxisExtent: 40,
                                ),
                                itemCount: PermissionsSingleton
                                    .instance.permissions.length,
                                itemBuilder: (context, index) {
                                  final role = PermissionsSingleton
                                      .instance.permissions[index];
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        value: widget.role.permissions!.any(
                                          (roleRole) => roleRole.id == role.id,
                                        ),
                                        onChanged: (bool? value) {
                                          setState(
                                            () {
                                              if (value == true) {
                                                widget.role =
                                                    widget.role.copyWith(
                                                  permissions: List.from(
                                                      widget.role.permissions ??
                                                          [])
                                                    ..add(role),
                                                );
                                              } else {
                                                widget.role =
                                                    widget.role.copyWith(
                                                  permissions: List.from(
                                                      widget.role.permissions ??
                                                          [])
                                                    ..removeWhere(
                                                      (roleRole) =>
                                                          roleRole.id ==
                                                          role.id,
                                                    ),
                                                );
                                              }
                                            },
                                          );
                                        },
                                      ),
                                      Expanded(
                                        child: CustomText(
                                          text: role.name ?? 'No Name',
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
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
                    CustomTextButtonWidget(
                      // width: 450.w,
                      textColor: Colors.green,
                      widget: state.maybeWhen(
                        loading: () {
                          return CustomCircularProgress();
                        },
                        orElse: () {
                          return CustomText(
                            text: "حفظ",
                            fontSize: 30.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          );
                        },
                      ),
                      onPressed: () {
                        context.read<RolesBloc>().add(
                              RolesEvent.edit(
                                role: widget.role,
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
