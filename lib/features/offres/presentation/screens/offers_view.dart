import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/custom_data_cell.dart';
import '../../../../core/global/gobal_widgets/custom_data_column.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/global/gobal_widgets/image_preview.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/offers_response_model.dart';
import '../bloc/offers_event.dart';
import '../bloc/offres_bloc.dart';
import '../bloc/offers_state.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  @override
  void initState() {
    super.initState();
    context.read<OffersBloc>().add(const OffersEvent.getOffersEvent());
  }

  @override
  Widget build(context) {
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
              state.mapOrNull(initial: (a) {
                context
                    .read<OffersBloc>()
                    .add(const OffersEvent.getOffersEvent());
              });
              return state.maybeWhen(
                loading: () => CustomCircularProgress(),
                offersLoaded: (offers) => buildOffersTable(offers!),
                orElse: () => const Center(
                  child: Text("No data available"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // إنشاء جدول العروض بناءً على البيانات المحملة
  Widget buildOffersTable(List<Offer> offers) {
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
              label: 'صورة العرض',
            ),
            DataColumn(
              label: CustomTextButton(
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
                    label: offer.name,
                  ),
                  DataCell(
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageScreen(
                              imageUrl: offer.image,
                            ),
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        height: 100.h,
                        width: 100.w,
                        imageUrl: offer.image,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const DataCell(SizedBox()),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
