import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
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
      route: 'فئات',
      body: Center(
        child: BlocProvider(
          create: (context) => getIt<CategoriesBloc>(),
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
              state.whenOrNull(
                initial: () {
                  context.read<CategoriesBloc>().add(
                        const CategoriesEvent.getCategoriesEvent(),
                      );
                },
              );
              return state.maybeWhen(
                categoriesLoaded: (categories) {
                  return SingleChildScrollView(
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
                            onPressed: () {
                              customNavigation(
                                context: context,
                                path: '/AddCategoryView',
                              );
                            },
                            text: 'أضافة فئة',
                          ),
                        ),
                      ],
                      rows: categories!.map(
                        (category) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  category.id.toString(),
                                ),
                              ),
                              DataCell(
                                Text(
                                  category.name.toString(),
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
                  );
                },
                orElse: () => const CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
