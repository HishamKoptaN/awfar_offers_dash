import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/global/custom_button.dart';
import '../../../../core/global/custom_circular_progress.dart';
import '../../../../core/global/custom_dropdown_button.dart';
import '../../../../core/global/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/global/gobal_widgets/snack_bar.dart';
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
                    hintText: 'اسم الفئة الفرعية',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      addSubCategoryRequestBodyModel.name = value;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomDropdownContainer<Category>(
                    height: 75.h,
                    width: 450.w,
                    items: categories,
                    selectedItem: selectedCategory,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedCategory = value;
                          addSubCategoryRequestBodyModel.categoryId =
                              value!.id!;
                        },
                      );
                    },
                    itemLabel: (item) => item.name!,
                    fontSize: 20.sp,
                    hint: 'أختر فئة الفرعية',
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
                          color: Colors.white,
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
