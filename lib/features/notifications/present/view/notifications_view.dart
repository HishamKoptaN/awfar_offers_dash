import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/app_layout.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_data_cell.dart';
import '../../../../core/widgets/custom_data_column.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/generic_table_view.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/singletons/notifications_singleton.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../bloc/notifications_bloc.dart';
import '../bloc/notifications_event.dart';
import '../bloc/notifications_state.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({
    super.key,
  });

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(
    context,
  ) {
    return AppLayout(
      route: '',
      showAppBar: false,
      body: BlocProvider(
        create: (_) => NotificationsBloc(
          getNotificationsUseCase: getIt(),
          editNotificationsUseCase: getIt(),
          addNotificationUseCase: getIt(),
          deleteNotificationUseCase: getIt(),
        )..add(
            const NotificationsEvent.get(),
          ),
        child: BlocConsumer<NotificationsBloc, NotificationsState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ToastNotifier().showSuccess(
                  context: context,
                  message: "نجاح",
                );
                context
                    .read<NotificationsBloc>()
                    .add(const NotificationsEvent.refersh());
              },
              failure: (apiErrorModel) {
                ToastNotifier().showFailure(
                  context: context,
                  message: apiErrorModel.error!,
                );
                context
                    .read<NotificationsBloc>()
                    .add(const NotificationsEvent.refersh());
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loaded: () {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            textInputType: TextInputType.text,
                            onChanged: (value) {
                              // NotifyRequest().message = value!;
                            },
                            label: ' محتوي الاشعار',
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomTextButtonWidget(
                          // width: 100.w,
                          widget: state.maybeWhen(
                            loading: () {
                              return CustomCircularProgress();
                            },
                            orElse: () {
                              return CustomText(
                                text: "أضافة",
                                fontSize: 15.sp,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              );
                            },
                          ),
                          onPressed: () {
                            // if (NotifyRequest().message!.isNotEmpty) {
                            //   NotifyRequest().public = true;
                            //   context.read<NotificationsBloc>().add(
                            //         NotificationsEvent.add(
                            //           notifyRequest: NotifyRequest(),
                            //         ),
                            //       );
                            // }
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: GenericTableView(
                        columns: [
                          customDataColumn(
                            label: 'المعرف',
                          ),
                          customDataColumn(
                            label: 'الرسالة',
                          ),
                          customDataColumn(
                            label: 'النوع',
                          ),
                          customDataColumn(
                            label: 'أنشأت بتاريخ',
                          ),
                        ],
                        items: NotificationsSingleton.instance.notifications,
                        buildRow: (notification) {
                          return DataRow(
                            cells: [
                              customDataCell(
                                label: notification.id!.toString(),
                              ),
                              customDataCell(
                                label: notification.message.toString(),
                              ),
                              customDataCell(
                                label: notification.type.toString(),
                              ),
                              customDataCell(
                                label: notification.createdAt!,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              orElse: () {
                return CustomCircularProgress();
              },
            );
          },
        ),
      ),
    );
  }
}
