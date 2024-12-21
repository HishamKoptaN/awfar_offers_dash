import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/category.dart';
import '../../../sub_categories/data/models/sub_categories_response_model.dart';
import '../bloc/categories_event.dart';
import '../bloc/categories_state.dart';
import '../bloc/categories_bloc.dart';

class EditCategoryView extends StatefulWidget {
  EditCategoryView({
    super.key,
    required this.category,
  });
  Category category;

  @override
  State<EditCategoryView> createState() => _EditCategoryViewState();
}

class _EditCategoryViewState extends State<EditCategoryView> {
  SubCategory? selectedSubCategory;
  Uint8List? imageBytes;
  Category? category;
  @override
  void initState() {
    super.initState();
    category = widget.category;
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'تعديل بيانات الفئة',
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    label: 'الاسم',
                    initialValue: widget.category.name,
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      category = category?.copyWith(
                        name: value,
                      );
                    },
                  ),
                  Gap(
                    50.h,
                  ),
                  CustomTextButtonWidget(
                    widget: state.maybeWhen(
                      loading: () {
                        return CustomCircularProgress();
                      },
                      orElse: () {
                        return CustomText(
                          text: "حفظ",
                          fontSize: 30.sp,
                          color: AppColors.white,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        );
                      },
                    ),
                    onPressed: () async {
                      state.maybeWhen(
                        loading: () {},
                        orElse: () async {
                          category = category?.copyWith(
                            id: widget.category.id,
                          );
                          context.read<CategoriesBloc>().add(
                                CategoriesEvent.edit(
                                  category: category!,
                                ),
                              );
                        },
                      );
                    },
                  ),
                  Gap(
                    50.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
