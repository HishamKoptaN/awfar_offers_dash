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
import '../../data/models/categories_response_model.dart';
import '../bloc/categories_bloc.dart';
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
        ),
        child: BlocConsumer<CategoriesBloc, CategoriesState>(
          listener: (context, state) async {
            await state.whenOrNull(
              failure: (error) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      error,
                    ),
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
                          label: 'معرف الدوله',
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
