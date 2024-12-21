import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_layout.dart';
import '../../../../../core/functions/navigation.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_data_column.dart';
import '../../../../../core/widgets/generic_table_view.dart';
import '../../../../../core/widgets/global_widgets.dart';
import '../../../../../core/widgets/image_preview.dart';
import '../../../../../core/methods/convert_date.dart';
import '../../../../../core/models/offer.dart';
import '../../../../../core/singletons/offer_groups_singleton.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../offer_groups/presentation/bloc/offer_groups_bloc.dart';
import '../../../../offer_groups/presentation/bloc/offer_groups_event.dart';
import '../../../../offer_groups/presentation/bloc/offer_groups_state.dart';
import '../../../data/models/store.dart';
import 'app_bar_in_offer_details.dart';

class StoreDetailsView extends StatefulWidget {
  const StoreDetailsView({
    super.key,
    required this.store,
  });
  final Store store;

  @override
  State<StoreDetailsView> createState() => _StoreDetailsViewState();
}

class _StoreDetailsViewState extends State<StoreDetailsView> {
  int? selectedOfferGroupIndex = 0;
  int? selectedOfferGroupId;
  @override
  void initState() {
    super.initState();
    context.read<OfferGroupsBloc>().add(
          OfferGroupsEvent.get(
            storeId: widget.store.id!,
          ),
        );
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'بيانات المتجر',
      body: SingleChildScrollView(
        child: BlocBuilder<OfferGroupsBloc, OfferGroupsState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: () {
                return Column(
                  children: [
                    SizedBox(
                      height: 250.h,
                      child: Row(
                        children: [
                          Center(
                            child: CustomIconButtonWidget(
                              onPressed: () {
                                customNavigation(
                                  context: context,
                                  path: '/AddOfferGroupView',
                                  extra: widget.store.id,
                                );
                              },
                              text: 'أضافة مجموعة عروض',
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: OfferGroupsSingleton
                                  .instance.offersGroups.length,
                              itemBuilder: (context, index) {
                                final offerGroup = OfferGroupsSingleton
                                    .instance.offersGroups[index];
                                selectedOfferGroupId = offerGroup.id;
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        selectedOfferGroupIndex = index;
                                        setState(() {});
                                      },
                                      child: SizedBox(
                                        height: 150.h,
                                        width: 100.w,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: selectedOfferGroupIndex ==
                                                    index
                                                ? AppColors.lightPrimaryColor
                                                : AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Card(
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: offerGroup.offers
                                                                  ?.isNotEmpty ==
                                                              true &&
                                                          offerGroup
                                                                  .offers
                                                                  ?.first
                                                                  .image
                                                                  .isNotEmpty ==
                                                              true
                                                      ? Image.network(
                                                          offerGroup
                                                                  .offers
                                                                  ?.first
                                                                  .image ??
                                                              '',
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              const Icon(
                                                            Icons.error,
                                                          ),
                                                        )
                                                      : const Icon(
                                                          Icons.image,
                                                          size: 50,
                                                        ),
                                                ),
                                                CustomText(
                                                  text: offerGroup.name ?? '',
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    CustomText(
                                      text: "ينتهي في  ${formatDate(
                                        offerGroup.endAt.toString(),
                                      )}",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      maxLines: 2,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (selectedOfferGroupIndex != null &&
                        OfferGroupsSingleton.instance.offersGroups.isNotEmpty)
                      SizedBox(
                        height: 450.h,
                        width: double.infinity,
                        child: GenericTableView<Offer>(
                          dataRowHeight: 125.h,
                          columns: [
                            customDataColumn(
                              label: 'صورة العرض',
                            ),
                            DataColumn(
                              label: CustomTextButtonWidget(
                                onPressed: () {
                                  customNavigation(
                                    context: context,
                                    path: '/AddOfferView',
                                    extra: selectedOfferGroupId,
                                  );
                                },
                                text: 'أضافة عرض',
                              ),
                            ),
                          ],
                          items: OfferGroupsSingleton.instance
                              .offersGroups[selectedOfferGroupIndex!].offers,
                          buildRow: (offer) => DataRow(
                            cells: [
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
                              DataCell(
                                Row(
                                  children: [
                                    CustomTextButtonWidget(
                                      onPressed: () {
                                        customNavigation(
                                          context: context,
                                          path: '/OfferProductsView',
                                          extra: offer.id,
                                        );
                                      },
                                      text: 'عرض المنتجات',
                                    ),
                                    CustomTextButtonWidget(
                                      onPressed: () {
                                        customNavigation(
                                          context: context,
                                          path: '/EditStoreView',
                                          extra: offer,
                                        );
                                      },
                                      text: 'تعديل',
                                    ),
                                    CustomTextButtonWidget(
                                      widget: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 35.sp,
                                      ),
                                      onPressed: () {
                                        // context.read<StoresBloc>().add(
                                        //       StoresEvent.delete(
                                        //         id: store.id ?? 0,
                                        //       ),
                                        //     );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
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
    );
  }
}
