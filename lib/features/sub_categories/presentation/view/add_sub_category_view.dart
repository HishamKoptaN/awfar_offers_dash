import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/global/custom_circular_progress.dart';
import '../../../../core/global/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/global/gobal_widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../categories/data/models/categories_response_model.dart';
import '../../../countries/data/models/countries_response_model.dart';
import '../../data/models/add_sub_category_request_body_model.dart';
import '../bloc/sub_categories_bloc.dart';
import '../bloc/sub_categories_event.dart';
import '../bloc/sub_categories_state.dart';

class AddSubCategoryView extends StatefulWidget {
  const AddSubCategoryView({
    super.key,
  });

  @override
  State<AddSubCategoryView> createState() => _AddSubCategoryViewState();
}

Country? selectedCountry;
AddSubCategoryRequestBodyModel addSubCategoryRequestBodyModel =
    AddSubCategoryRequestBodyModel();

class _AddSubCategoryViewState extends State<AddSubCategoryView> {
  Category? selectedCategory;
  final categories = CategoriesResponseModel().categories ?? [];

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة فئة فرعية',
      // onPressed: () {
      //   customNavigation(
      //     context: context,
      //     path: '/',
      //   );
      // },
      body: BlocProvider(
        create: (_) => getIt<SubCategoriesBloc>(),
        child: BlocConsumer<SubCategoriesBloc, SubCategoriesState>(
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
              failure: (error) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  snackBar(
                    status: false,
                    message: error,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    hintText: 'اسم الفئة',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      addSubCategoryRequestBodyModel.name = value;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  Container(
                    height: 75.h,
                    width: 450.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<Category>(
                      isExpanded: true,
                      value: selectedCategory,
                      onChanged: (value) {
                        setState(
                          () {
                            selectedCategory = value;
                            addSubCategoryRequestBodyModel.categoryId =
                                value!.id!;
                          },
                        );
                      },
                      dropdownColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      items: categories.map(
                        (subcategory) {
                          return DropdownMenuItem<Category>(
                            value: subcategory,
                            child: Center(
                              child: CustomText(
                                text: subcategory.name!,
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextButton(
                    widget: state.maybeWhen(
                      loading: () {
                        return CustomCircularProgress();
                      },
                      orElse: () {
                        return CustomText(
                          text: 'أضافة',
                          fontSize: 30.sp,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        );
                      },
                    ),
                    onPressed: () async {
                      context.read<SubCategoriesBloc>().add(
                            SubCategoriesEvent.addSubCategoryEvent(
                              addCategoryRequestBodyModel:
                                  addSubCategoryRequestBodyModel,
                            ),
                          );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
