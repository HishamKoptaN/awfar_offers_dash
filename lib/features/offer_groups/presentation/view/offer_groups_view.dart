import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_layout.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/functions/navigation.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_data_cell.dart';
import '../../../../core/widgets/custom_data_column.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../data/models/offer_group.dart';
import '../bloc/offer_groups_event.dart';
import '../bloc/offer_groups_state.dart';
import '../bloc/offer_groups_bloc.dart';

class OfferGroupsView extends StatefulWidget {
  const OfferGroupsView({super.key});

  @override
  State<OfferGroupsView> createState() => _OfferGroupsViewState();
}

class _OfferGroupsViewState extends State<OfferGroupsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: false,
      backArow: false,
      route: 'العروض',
      body: BlocProvider(
        create: (context) => getIt<OfferGroupsBloc>(),
        child: BlocConsumer<OfferGroupsBloc, OfferGroupsState>(
          listener: (context, state) async {
            await state.whenOrNull(
              success: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("نجاح"),
                  ),
                );
              },
              failure: (apiErrorModel) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      apiErrorModel.error!,
                    ),
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => CustomCircularProgress(),
              orElse: () {
                return CustomCircularProgress();
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildOfferGroupsTable({required List<OfferGroup> offers}) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          dataRowHeight: 125.h,
          columns: [
            customDataColumn(
              label: 'معرف العرض',
            ),
            customDataColumn(
              label: 'الاسم',
            ),
            customDataColumn(
              label: 'ينتهي بعد',
            ),
            customDataColumn(
              label: 'معرف العرض',
            ),
            DataColumn(
              label: CustomTextButtonWidget(
                widget: CustomText(
                  text: 'أضافة عرض',
                  fontSize: 30.sp,
                  color: AppColors.white,
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () {
                  customNavigation(
                    context: context,
                    path: '/AddOfferView',
                  );
                },
              ),
            ),
          ],
          rows: offers.map(
            (offer) {
              return DataRow(
                cells: [
                  customDataCell(
                    label: offer.id.toString(),
                  ),
                  customDataCell(
                    label: offer.name ?? '',
                  ),
                  customDataCell(
                    label: offer.daysRemaining.toString(),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: CustomTextButtonWidget(
                        onPressed: () {
                          customNavigation(
                            context: context,
                            path: '/EditOfferView',
                            extra: offer,
                          );
                        },
                        text: 'تعديل',
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: CustomTextButtonWidget(
                        widget: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 35.sp,
                        ),
                        onPressed: () {
                          context.read<OfferGroupsBloc>().add(
                                OfferGroupsEvent.delete(
                                  id: offer.id!,
                                ),
                              );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
