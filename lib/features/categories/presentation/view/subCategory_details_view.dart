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
import '../../../../core/singletons/markas_singleton.dart';
import '../../../sub_categories/data/models/sub_categories_response_model.dart';
import '../../../sub_categories_items/data/models/marka.dart';
import '../../../sub_categories_items/presentation/bloc/markas_bloc.dart';
import '../../../sub_categories_items/presentation/bloc/markas_event.dart';
import '../../../sub_categories_items/presentation/bloc/markas_state.dart';
import 'widgets/app_bar_in_sub_category_details.dart';

class SubCategoryDetailsView extends StatefulWidget {
  const SubCategoryDetailsView({
    super.key,
    required this.subCategory,
  });
  final SubCategory subCategory;
  @override
  State<SubCategoryDetailsView> createState() => _SubCategoryDetailsViewState();
}

class _SubCategoryDetailsViewState extends State<SubCategoryDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<MarkasBloc>().add(
          MarkasEvent.get(
            id: widget.subCategory.id ?? 0,
          ),
        );
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'تفاصيل الفئة الفرعية',
      body: SingleChildScrollView(
        child: BlocBuilder<MarkasBloc, MarkasState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: () {
                return SizedBox(
                  height: 450.h,
                  width: double.infinity,
                  child: GenericTableView<Marka>(
                    dataRowHeight: 125.h,
                    columns: [
                      customDataColumn(
                        label:
                            'الماركات للفئة الفرعية ${widget.subCategory.name ?? ''}',
                      ),
                      DataColumn(
                        label: CustomTextButtonWidget(
                          onPressed: () {
                            customNavigation(
                              context: context,
                              path: '/AddMarkaView',
                              extra: widget.subCategory.id,
                            );
                          },
                          text: 'أضافة  ماركة',
                        ),
                      ),
                    ],
                    items: MarkasSingleton.instance.markas
                        .where(
                          (s) => s.subCategoryId == widget.subCategory.id,
                        )
                        .toList(),
                    buildRow: (marka) => DataRow(
                      cells: [
                        customDataCell(
                          label: marka.name ?? '',
                        ),
                        DataCell(
                          Row(
                            children: [
                              CustomTextButtonWidget(
                                onPressed: () {
                                  customNavigation(
                                    context: context,
                                    path: '/EditMarkaView',
                                    extra: marka,
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
                                  context.read<MarkasBloc>().add(
                                        MarkasEvent.delete(
                                          id: marka.id ?? 0,
                                        ),
                                      );
                                },
                              ),
                            ],
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
      ),
    );
  }
}
