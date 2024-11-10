import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/global/gobal_widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../categories/data/models/categories_response_model.dart';
import '../../../stores/data/models/stores_response_model.dart';
import '../../../sub_categories/data/models/sub_categories_response_model.dart';
import '../../data/models/edit_category_request_model.dart';
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
  Store? selectedStore;
  SubCategory? selectedSubCategory;
  Category? selectedCategory;
  Uint8List? imageBytes;

  @override
  void initState() {
    super.initState();
    EditCategoryRequestBodyModel().id = widget.category.id;
    EditCategoryRequestBodyModel().name = widget.category.name;
    selectedCategory = widget.category;
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'تعديل بيانات الفئة',
      // onPressed: () {
      //   customNavigation(
      //     context: context,
      //     path: '/',
      //   );
      // },
      body: BlocConsumer<CategoriesBloc, CategoriesState>(
        listener: (context, state) {
          state.whenOrNull(
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
                      EditCategoryRequestBodyModel().name = value!;
                    },
                  ),
                  Gap(
                    50.h,
                  ),
                  CustomTextButton(
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
                          final category = Category(
                            id: EditCategoryRequestBodyModel().id!,
                            name: EditCategoryRequestBodyModel().name!,
                          );
                          context.read<CategoriesBloc>().add(
                                CategoriesEvent.edit(
                                  category: category,
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
