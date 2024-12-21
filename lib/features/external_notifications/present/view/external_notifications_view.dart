import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/singletons/governoarates_singleton.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_layout.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_dropdown_button.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../../../countries/data/models/countries_res_model.dart';
import '../../../countries/presentation/bloc/countries_bloc.dart';
import '../../../countries/presentation/bloc/countries_state.dart';
import '../../../governorates/data/models/governorates_response_model.dart';
import '../../../governorates/presentation/bloc/governorates_bloc.dart';
import '../../../governorates/presentation/bloc/governorates_state.dart';
import '../../../governorates/presentation/pages/add_governorate_view.dart';
import '../../data/model/external_notification.dart';
import '../bloc/external_notifications_bloc.dart';
import '../bloc/external_notifications_event.dart';
import '../bloc/external_notifications_state.dart';

class ExternalNotificationsView extends StatefulWidget {
  const ExternalNotificationsView({
    super.key,
  });

  @override
  State<ExternalNotificationsView> createState() =>
      _ExternalNotificationsViewState();
}

class _ExternalNotificationsViewState extends State<ExternalNotificationsView> {
  ExternalNotification externalNotification = const ExternalNotification();
  Country? selectedCountry;
  Governorate? selectedGovernorate;
  @override
  Widget build(
    context,
  ) {
    return AppLayout(
      route: '',
      showAppBar: false,
      body: BlocProvider(
        create: (_) => ExternalNotificationsBloc(
          addExternalNotificationUseCase: getIt(),
        ),
        child:
            BlocConsumer<ExternalNotificationsBloc, ExternalNotificationsState>(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    height: 75.h,
                    width: 300.w,
                    label: "العنوان",
                    onChanged: (value) {
                      externalNotification = externalNotification.copyWith(
                        title: value,
                      );
                    },
                  ),
                  Gap(
                    5.h,
                  ),
                  CustomTextFormField(
                    height: 75.h,
                    width: 300.w,
                    label: 'محتوى الإشعار',
                    onChanged: (value) {
                      externalNotification = externalNotification.copyWith(
                        message: value,
                      );
                    },
                  ),
                  Gap(
                    5.h,
                  ),
                  Container(
                    height: 75.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: BlocBuilder<CountriesBloc, CountriesState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loaded: () {
                            return DropdownButton<Country>(
                              isExpanded: true,
                              value: selectedCountry,
                              onChanged: (value) {
                                setState(
                                  () {
                                    selectedCountry = value;
                                    selectedGovernorate = null;
                                  },
                                );
                              },
                              items: countries.map(
                                (country) {
                                  return DropdownMenuItem<Country>(
                                    value: country,
                                    child: Center(
                                      child: Flag.fromString(
                                        country.code!,
                                        height: 50.h,
                                        width: 100.w,
                                        fit: BoxFit.fill,
                                        replacement: Flag.fromString(
                                          country.code!,
                                          height: 50.h,
                                          width: 100.w,
                                          fit: BoxFit.fill,
                                          replacement: CustomText(
                                            text: country.code ?? 'أختر الدوله',
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
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
                  Gap(
                    5.h,
                  ),
                  BlocBuilder<GovernoratesBloc, GovernoratesState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: () {
                          final governorates =
                              GovernoratesSingleton.instance.governorates;
                          return CustomDropdownContainer<Governorate>(
                            height: 75.h,
                            width: 300.w,
                            items: governorates
                                .where(
                                  (governorate) =>
                                      governorate.countryId ==
                                      selectedCountry?.id,
                                )
                                .toList(),
                            selectedItem: selectedGovernorate,
                            onChanged: (
                              value,
                            ) {
                              setState(
                                () {
                                  selectedGovernorate = value;
                                },
                              );
                              externalNotification =
                                  externalNotification.copyWith(
                                topic: value?.id.toString(),
                              );
                            },
                            itemLabel: (item) => item.name!,
                            fontSize: 20.sp,
                            hint: 'أختر المدينة',
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
                  CustomTextButtonWidget(
                    onPressed: () {
                      context.read<ExternalNotificationsBloc>().add(
                            ExternalNotificationsEvent.add(
                              externalNotification: externalNotification,
                            ),
                          );
                    },
                    widget: CustomText(
                      text: ' إرسال',
                      fontSize: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
