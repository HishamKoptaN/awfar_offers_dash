import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
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
                loading: () =>
                    CustomCircularProgress(), // عرض مؤشر التحميل أثناء جلب البيانات
                offersLoaded: (offers) =>
                    buildOffersTable(offers!), // عرض الجدول عند توفر البيانات
                orElse: () => const Center(
                    child: Text("No data available")), // في حال عدم وجود بيانات
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
                widget: CustomText(
                  text: 'أضافة عرض',
                  fontSize: 30.sp,
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
                  DataCell(Text(offer.id.toString())),
                  DataCell(Text(offer.name)),
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
