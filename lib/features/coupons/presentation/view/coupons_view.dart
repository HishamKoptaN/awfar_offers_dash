import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_data_cell.dart';
import '../../../../core/widgets/custom_data_column.dart';
import '../../../../core/widgets/generic_table_view.dart';
import '../../../../core/singletons/coupons_singleton.dart';
import '../bloc/coupons_bloc.dart';
import '../bloc/coupons_event.dart';
import '../bloc/coupons_state.dart';

class CouponsView extends StatefulWidget {
  const CouponsView({super.key});
  @override
  State<CouponsView> createState() => _CouponsViewState();
}

class _CouponsViewState extends State<CouponsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: false,
      backArow: false,
      route: '',
      body: BlocConsumer<CouponsBloc, CouponsState>(
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
                  content: Text(apiErrorModel.error!),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return CustomCircularProgress();
            },
            orElse: () {
              return GenericTableView(
                columns: [
                  customDataColumn(
                    label: 'معرف الكوبون',
                  ),
                  customDataColumn(
                    label: 'المتجر',
                  ),
                  customDataColumn(
                    label: 'الوصف',
                  ),
                  customDataColumn(
                    label: 'الكود',
                  ),
                  customDataColumn(
                    label: '',
                  ),
                  DataColumn(
                    label: CustomTextButtonWidget(
                      onPressed: () {
                        customNavigation(
                          context: context,
                          path: '/AddCouponView',
                        );
                      },
                      text: 'أضافة كوبون خصم',
                    ),
                  ),
                ],
                items: CouponsSingleton.instance.coupons,
                buildRow: (coupon) => DataRow(
                  cells: [
                    customDataCell(
                      label: coupon.id.toString(),
                    ),
                    customDataCell(
                      label: coupon.store?.name ?? "",
                    ),
                    customDataCell(
                      label: coupon.description ?? "",
                    ),
                    customDataCell(
                      label: coupon.code ?? "",
                    ),
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: CustomTextButtonWidget(
                          onPressed: () {
                            customNavigation(
                              context: context,
                              path: '/EditCouponView',
                              extra: coupon,
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
                            context.read<CouponsBloc>().add(
                                  CouponsEvent.delete(
                                    id: coupon.id!,
                                  ),
                                );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
