import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../data/models/offers_response_model.dart';
import '../bloc/offres_bloc.dart';
import '../bloc/offers_state.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(context) {
    final offers = OffersResponseModel().offers ?? [];
    return MainLayout(
      showAppBar: false,
      backArow: false,
      route: 'العروض',
      body: Center(
        child: BlocProvider(
          create: (context) => getIt<OffersBloc>(),
          child: BlocConsumer<OffersBloc, OffersState>(
            listener: (context, state) {
              state.maybeWhen(
                failure: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        error.error!,
                      ),
                    ),
                  );
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: CustomText(
                              text: 'معرف العرض',
                              fontSize: 30.sp,
                            ),
                          ),
                          DataColumn(
                            label: CustomText(
                              text: 'الاسم',
                              fontSize: 30.sp,
                            ),
                          ),
                          DataColumn(
                            label: CustomText(
                              text: 'صورة',
                              fontSize: 30.sp,
                            ),
                          ),
                          DataColumn(
                            label: CustomTextButton(
                              widget: state.maybeWhen(
                                loading: () {
                                  return CustomCircularProgress();
                                },
                                orElse: () {
                                  return CustomText(
                                    text: 'أضافة عرض',
                                    fontSize: 30.sp,
                                    maxLines: 1,
                                    fontWeight: FontWeight.bold,
                                  );
                                },
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
                                DataCell(
                                  Text(
                                    offer.id.toString(),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    offer.name,
                                  ),
                                ),
                                DataCell(
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    child: Image.network(
                                      offer.image,
                                      height: 225.h,
                                      width: 100.w,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const DataCell(
                                  SizedBox(),
                                ),
                              ],
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  );
                },
                loading: () => CustomCircularProgress(),
              );
            },
          ),
        ),
      ),
    );
  }
}
