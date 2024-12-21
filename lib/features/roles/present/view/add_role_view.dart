import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/models/role.dart';
import '../../../../core/widgets/app_layout.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../bloc/roles_bloc.dart';
import '../bloc/roles_event.dart';
import '../bloc/roles_state.dart';

class CreateRoleView extends StatelessWidget {
  CreateRoleView({
    super.key,
  });
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(context) {
    Role role = const Role();
    return AppLayout(
      route: 'Create Role',
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
              failure: (apiErrorModel) {
                ToastNotifier().showFailure(
                  context: context,
                  message: apiErrorModel.error!,
                );
              },
            );
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomTextFormField(
                        label: 'الاسم',
                        textInputType: TextInputType.text,
                        onChanged: (value) {
                          role = role.copyWith(
                            name: value,
                          );
                        },
                      ),
                      Gap(
                        10.h,
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
                              text: "اضافة",
                              fontSize: 30.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            );
                          },
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<RolesBloc>().add(
                                  RolesEvent.add(
                                    role: role,
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
