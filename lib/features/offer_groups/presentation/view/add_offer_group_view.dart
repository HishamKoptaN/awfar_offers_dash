import 'package:awfar_offers_dash/features/offer_groups/presentation/bloc/offer_groups_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/app_layout.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/add_offer_group_req_body_model.dart';
import '../bloc/offer_groups_bloc.dart';
import '../bloc/offer_groups_state.dart';

class AddOfferGroupView extends StatefulWidget {
  AddOfferGroupView({
    super.key,
    required this.storeId,
  });
  int storeId;

  @override
  State<AddOfferGroupView> createState() => _AddOfferGroupViewState();
}

class _AddOfferGroupViewState extends State<AddOfferGroupView> {
  AddOfferGroupReqBodyModel addOfferGroupReqBodyModel =
      const AddOfferGroupReqBodyModel();
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة مجموعة عروض',
      body: BlocProvider(
        create: (_) => OfferGroupsBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
        child: BlocConsumer<OfferGroupsBloc, OfferGroupsState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  snackBar(
                    status: true,
                    message: 'نجاح',
                  ),
                );
              },
              failure: (error) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  snackBar(
                    status: false,
                    message: error.error!,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return SizedBox.expand(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomTextFormField(
                      label: 'الاسم',
                      textInputType: TextInputType.text,
                      onChanged: (value) {
                        addOfferGroupReqBodyModel =
                            addOfferGroupReqBodyModel.copyWith(
                          name: value,
                        );
                      },
                    ),
                    Gap(
                      10.h,
                    ),
                    SizedBox(
                      height: 250.h,
                      width: 450.w,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'اختر الفترة الزمنية:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GestureDetector(
                              onTap: () async {
                                final DateTimeRange? picked =
                                    await showDateRangePicker(
                                  context: context,
                                  initialDateRange: addOfferGroupReqBodyModel
                                                  .startAt !=
                                              null &&
                                          addOfferGroupReqBodyModel.endAt !=
                                              null
                                      ? DateTimeRange(
                                          start: addOfferGroupReqBodyModel
                                              .startAt!,
                                          end: addOfferGroupReqBodyModel.endAt!,
                                        )
                                      : null,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050),
                                );

                                if (picked != null) {
                                  setState(
                                    () {
                                      addOfferGroupReqBodyModel =
                                          addOfferGroupReqBodyModel.copyWith(
                                        startAt: picked.start,
                                        endAt: picked.end,
                                      );
                                    },
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      addOfferGroupReqBodyModel.startAt !=
                                                  null &&
                                              addOfferGroupReqBodyModel.endAt !=
                                                  null
                                          ? '${addOfferGroupReqBodyModel.startAt!.toLocal().toString().split(' ')[0]} - ${addOfferGroupReqBodyModel.endAt!.toLocal().toString().split(' ')[0]}'
                                          : 'اضغط لتحديد الفترة الزمنية',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const Icon(
                                      Icons.calendar_today,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            if (addOfferGroupReqBodyModel.startAt != null &&
                                addOfferGroupReqBodyModel.endAt != null)
                              Text(
                                'التاريخ المحدد:\nمن: ${addOfferGroupReqBodyModel.startAt!.toLocal().toString().split(' ')[0]}\nإلى: ${addOfferGroupReqBodyModel.endAt!.toLocal().toString().split(' ')[0]}',
                                style: const TextStyle(fontSize: 16),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Gap(
                      10.h,
                    ),
                    CustomTextButtonWidget(
                      widget: state.maybeWhen(
                        loading: () {
                          return CustomCircularProgress();
                        },
                        orElse: () {
                          return CustomText(
                            text: 'أضافة',
                            fontSize: 30.sp,
                            maxLines: 1,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          );
                        },
                      ),
                      onPressed: () async {
                        addOfferGroupReqBodyModel =
                            addOfferGroupReqBodyModel.copyWith(
                          storeId: widget.storeId,
                        );
                        context.read<OfferGroupsBloc>().add(
                              OfferGroupsEvent.add(
                                addOfferGroupReqBodyModel:
                                    addOfferGroupReqBodyModel,
                              ),
                            );
                      },
                    ),
                    Gap(
                      50.h,
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
