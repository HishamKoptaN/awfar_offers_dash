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
                      dataRowHeight: 125.h,
                      columns: [
                        customDataColumn(
                          label: 'معرف الدوله',
                        ),
                        customDataColumn(
                          label: 'الاسم',
                        ),
                        customDataColumn(
                          label: 'صورة الفئة الفرعية',
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
                                  color: AppColors.white,
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
                              customDataCell(
                                label: subCategory.id.toString(),
                              ),
                              customDataCell(
                                label: subCategory.name.toString(),
                              ),
                              DataCell(
                                InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ImageScreen(
                                          imageUrl: subCategory.image!,
                                        ),
                                      ),
                                    );
                                  },
                                  child: CachedNetworkImage(
                                    height: 100.h,
                                    width: 100.w,
                                    fit: BoxFit.fill,
                                    imageUrl: subCategory.image!,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
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
