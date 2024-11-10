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
import '../../data/models/categories_response_model.dart';
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
    final categories = CategoriesResponseModel().categories ?? [];
    return MainLayout(
      showAppBar: false,
      route: '',
      body: BlocProvider(
        create: (context) => CategoriesBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
        child: BlocConsumer<CategoriesBloc, CategoriesState>(
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
                return SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      columns: [
                        customDataColumn(
                          label: 'معرف الفئة',
                        ),
                        customDataColumn(
                          label: 'الاسم',
                        ),
                        customDataColumn(
                          label: 'الاسم',
                        ),
                        customDataColumn(
                          label: 'الاسم',
                        ),
                        DataColumn(
                          label: CustomTextButton(
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
                      rows: categories.map(
                        (category) {
                          return DataRow(
                            cells: [
                              customDataCell(
                                label: category.id.toString(),
                              ),
                              customDataCell(
                                label: category.name.toString(),
                              ),
                              const DataCell(
                                SizedBox(),
                              ),
                              DataCell(
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: CustomTextButton(
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
                                  child: CustomTextButton(
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
                          );
                        },
                      ).toList(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
