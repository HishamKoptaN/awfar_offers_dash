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
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/singletons/categories_singletone.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/category.dart';
import '../bloc/categories_bloc.dart';
import '../bloc/categories_event.dart';
import '../bloc/categories_state.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
  });

  @override
  Widget build(
    context,
  ) {
    return MainLayout(
      showAppBar: false,
      route: '',
      body: BlocConsumer<CategoriesBloc, CategoriesState>(
        listener: (context, state) async {
          await state.whenOrNull(
            success: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                snackBar(
                  status: true,
                  message: 'نجاح',
                ),
              );
            },
            failure: (apiErrorModel) async {
              ScaffoldMessenger.of(context).showSnackBar(
                snackBar(
                  status: false,
                  message: apiErrorModel.error!,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loaded: () {
              return GenericTableView<Category>(
                dataRowHeight: 125.h,
                columns: [
                  customDataColumn(
                    label: 'معرف الفئة',
                  ),
                  customDataColumn(
                    label: 'الاسم',
                  ),
                  customDataColumn(
                    label: '',
                  ),
                  customDataColumn(
                    label: '',
                  ),
                  DataColumn(
                    label: CustomTextButtonWidget(
                      text: 'أضافة فئة',
                      onPressed: () {
                        customNavigation(
                          context: context,
                          path: '/AddCategoryView',
                        );
                      },
                    ),
                  ),
                ],
                items: CategoriesSingleton.instance.categories,
                buildRow: (category) => DataRow(
                  cells: [
                    customDataCell(
                      label: category.id.toString(),
                    ),
                    customDataCell(
                      label: category.name.toString(),
                    ),
                    DataCell(
                      CustomTextButtonWidget(
                        widget: CustomText(
                          text: 'عرض',
                          fontSize: 30.sp,
                          color: AppColors.white,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        ),
                        onPressed: () {
                          customNavigation(
                            context: context,
                            path: '/categoryDetailsView',
                            extra: category,
                          );
                        },
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: CustomTextButtonWidget(
                          onPressed: () {
                            customNavigation(
                              context: context,
                              path: '/EditCategoryView',
                              extra: category,
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
                            context.read<CategoriesBloc>().add(
                                  CategoriesEvent.delete(
                                    id: category.id!,
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
            orElse: () {
              return CustomCircularProgress();
            },
          );
        },
      ),
    );
  }
}
