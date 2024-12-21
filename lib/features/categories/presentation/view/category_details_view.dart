import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_layout.dart';
import '../../../../../core/functions/navigation.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_data_column.dart';
import '../../../../core/widgets/generic_table_view.dart';
import '../../../../core/widgets/custom_data_cell.dart';
import '../../../../core/widgets/image_preview.dart';
import '../../../../core/singletons/sub_categories_singletone.dart';
import '../../../sub_categories/data/models/sub_categories_response_model.dart';
import '../../../sub_categories/presentation/bloc/sub_categories_bloc.dart';
import '../../../sub_categories/presentation/bloc/sub_categories_event.dart';
import '../../../sub_categories/presentation/bloc/sub_categories_state.dart';
import '../../data/models/category.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({
    super.key,
    required this.category,
  });
  final Category category;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  int? selectedCategoryGroupIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'تفاصيل الفئة',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SubCategoriesBloc, SubCategoriesState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: () {
                    return SizedBox(
                      height: 450.h,
                      width: double.infinity,
                      child: GenericTableView<SubCategory>(
                        dataRowHeight: 125.h,
                        columns: [
                          customDataColumn(
                            label:
                                'الفئات الفرعية لفئة ${widget.category.name ?? ''}',
                          ),
                          customDataColumn(
                            label: '',
                          ),
                          customDataColumn(
                            label: '',
                          ),
                          customDataColumn(
                            label: '',
                          ),
                          DataColumn(
                            label: CustomTextButtonWidget(
                              onPressed: () {
                                customNavigation(
                                  context: context,
                                  path: '/AddSubCategoryView',
                                  extra: widget.category.id,
                                );
                              },
                              text: 'أضافة فئة فرعية',
                            ),
                          ),
                        ],
                        items: SubCategoriesSingleton.instance.subCategories!
                            .where(
                              (s) => s.categoryId == widget.category.id,
                            )
                            .toList(),
                        buildRow: (subCategory) => DataRow(
                          cells: [
                            customDataCell(
                              label: subCategory.name ?? '',
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
                            DataCell(
                              CustomTextButtonWidget(
                                onPressed: () {
                                  customNavigation(
                                    context: context,
                                    path: '/SubCategoryDetailsView',
                                    extra: subCategory,
                                  );
                                },
                                text: 'عرض الماركات',
                              ),
                            ),
                            DataCell(
                              CustomTextButtonWidget(
                                onPressed: () {
                                  customNavigation(
                                    context: context,
                                    path: '/EditSubCategoryView',
                                    extra: subCategory,
                                  );
                                },
                                text: 'تعديل',
                              ),
                            ),
                            DataCell(
                              CustomTextButtonWidget(
                                widget: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 35.sp,
                                ),
                                onPressed: () {
                                  context.read<SubCategoriesBloc>().add(
                                        SubCategoriesEvent.delete(
                                          id: subCategory.id ?? 0,
                                        ),
                                      );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
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
          ],
        ),
      ),
    );
  }
}
