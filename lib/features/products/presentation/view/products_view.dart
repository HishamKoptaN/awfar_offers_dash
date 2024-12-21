import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_data_cell.dart';
import '../../../../core/widgets/custom_data_column.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/image_preview.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/product.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_state.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    super.initState();
    // context.read<ProductsBloc>().add(const ProductsEvent.get());
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: false,
      backArow: false,
      route: 'المنتجات',
      body: BlocProvider(
        create: (context) => ProductsBloc(
          getProductsUseCase: getIt(),
          addProductsUseCase: getIt(),
          editUseCase: getIt(),
          deleteUseCase: getIt(),
        ),
        child: BlocConsumer<ProductsBloc, ProductsState>(
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
              loading: () => CustomCircularProgress(),
              orElse: () => CustomCircularProgress(),
            );
          },
        ),
      ),
    );
  }

  Widget buildProductsTable({required List<Product> prdoucts}) {
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
              label: 'صورة العرض',
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
                    path: '/AddPrdouctView',
                  );
                },
              ),
            ),
          ],
          rows: prdoucts.map(
            (prdouct) {
              return DataRow(
                cells: [
                  customDataCell(
                    label: prdouct.id.toString(),
                  ),
                  DataCell(
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageScreen(
                              imageUrl: prdouct.image ?? '',
                            ),
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        height: 100.h,
                        width: 100.w,
                        imageUrl: prdouct.image ?? '',
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: CustomTextButtonWidget(
                        onPressed: () {
                          customNavigation(
                            context: context,
                            path: '/EditPrdouctView',
                            extra: prdouct,
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
                          // context.read<ProductsBloc>().add(
                          //       ProductsEvent.delete(
                          //         id: prdouct.id,
                          //       ),
                          //     );
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
