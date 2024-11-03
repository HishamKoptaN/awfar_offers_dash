import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../data/models/sub_categories_response_model.dart';
import '../bloc/sub_categories_bloc.dart';
import '../bloc/sub_categories_state.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({
    super.key,
  });

  @override
  Widget build(
    context,
  ) {
    final subCategories = SubCategoriesResponseModel().subCategories ?? [];
    return MainLayout(
      showAppBar: false,
      route: '',
      body: BlocProvider(
        create: (context) => SubCategoriesBloc(
          getIt(),
          getIt(),
        ),
        child: BlocConsumer<SubCategoriesBloc, SubCategoriesState>(
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
                        DataColumn(
                          label: CustomText(
                            text: 'معرف الدوله',
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
                          label: CustomTextButton(
                            widget: state.maybeWhen(
                              loading: () {
                                return CustomCircularProgress();
                              },
                              orElse: () {
                                return CustomText(
                                  text: 'أضافة فئة فرعية',
                                  fontSize: 30.sp,
                                  maxLines: 1,
                                  fontWeight: FontWeight.bold,
                                );
                              },
                            ),
                            onPressed: () {
                              customNavigation(
                                context: context,
                                path: '/AddSubCategoryView',
                              );
                            },
                          ),
                        ),
                      ],
                      rows: subCategories.map(
                        (subCategory) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  subCategory.id.toString(),
                                ),
                              ),
                              DataCell(
                                Text(
                                  subCategory.name.toString(),
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
            );
          },
        ),
      ),
    );
  }
}
