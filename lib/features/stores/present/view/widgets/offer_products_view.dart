import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_layout.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/functions/navigation.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_data_cell.dart';
import '../../../../../core/widgets/custom_data_column.dart';
import '../../../../../core/widgets/generic_table_view.dart';
import '../../../../../core/widgets/image_preview.dart';
import '../../../../../core/singletons/products_singleton.dart';
import '../../../../products/data/models/product.dart';
import '../../../../products/presentation/bloc/products_bloc.dart';
import '../../../../products/presentation/bloc/products_event.dart';
import '../../../../products/presentation/bloc/products_state.dart';

class OfferProductsView extends StatefulWidget {
  const OfferProductsView({
    super.key,
    required this.offerId,
  });
  final int offerId;

  @override
  State<OfferProductsView> createState() => _OfferProductsViewState();
}

class _OfferProductsViewState extends State<OfferProductsView> {
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      backArow: false,
      route: 'منتجات العرض',
      body: Expanded(
        child: BlocProvider(
          create: (context) => ProductsBloc(
            getProductsUseCase: getIt(),
            addProductsUseCase: getIt(),
            editUseCase: getIt(),
            deleteUseCase: getIt(),
          )..add(
              ProductsEvent.get(
                offerId: widget.offerId,
              ),
            ),
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: () {
                  return GenericTableView<Product>(
                    dataRowHeight: 125.h,
                    columns: [
                      customDataColumn(
                        label: 'السعر',
                      ),
                      customDataColumn(
                        label: 'الخصم',
                      ),
                      customDataColumn(
                        label: 'صورة العرض',
                      ),
                      customDataColumn(
                        label: '',
                      ),
                      DataColumn(
                        label: CustomTextButtonWidget(
                          onPressed: () {
                            customNavigation(
                              context: context,
                              path: '/AddPrdouctView',
                              extra: widget.offerId,
                            );
                          },
                          text: 'أضافة منتج',
                        ),
                      ),
                    ],
                    items: ProductsSingleton.instance.products!,
                    buildRow: (product) => DataRow(
                      cells: [
                        customDataCell(
                          label: product.price!,
                        ),
                        customDataCell(
                          label: "خصم ${product.discountRate!}%",
                        ),
                        DataCell(
                          InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImageScreen(
                                    imageUrl: product.image!,
                                  ),
                                ),
                              );
                            },
                            child: CachedNetworkImage(
                              height: 100.h,
                              width: 100.w,
                              imageUrl: product.image!,
                              fit: BoxFit.fill,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: CustomTextButtonWidget(
                                  onPressed: () {
                                    customNavigation(
                                      context: context,
                                      path: '/EditStoreView',
                                      extra: product,
                                    );
                                  },
                                  text: 'تعديل',
                                ),
                              ),
                            ],
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
                                // context.read<StoresBloc>().add(
                                //       StoresEvent.delete(
                                //         id: store.id ?? 0,
                                //       ),
                                //     );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                loading: () {
                  return CustomCircularProgress();
                },
                orElse: () {
                  return CustomCircularProgress();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
