import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/custom_dropdown_button.dart';
import '../../../../core/global/gobal_widgets/custom_text_form_field.dart';
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

Uint8List? imageBytes;

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
                    message: error.error!,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
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
                    SizedBox(
                      height: 200.h,
                      width: 450.w,
                      child: InkWell(
                        onTap: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            final file = result.files.single;
                            setState(() {
                              imageBytes = file.bytes;
                            });
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: imageBytes == null
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.cloudArrowUp,
                                    ),
                                    Text(
                                      "أضف صورة للعرض",
                                    ),
                                    Gap(20),
                                  ],
                                )
                              : Image.memory(
                                  imageBytes!,
                                ),
                        ),
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
                            color: Colors.white,
                            maxLines: 1,
                            fontWeight: FontWeight.bold,
                          );
                        },
                      ),
                      onPressed: () async {
                        if (imageBytes != null &&
                            addSubCategoryRequestBodyModel.categoryId != null) {
                          FormData formData = FormData.fromMap(
                            {
                              'name': addSubCategoryRequestBodyModel.name,
                              'image': MultipartFile.fromBytes(
                                imageBytes!,
                                filename: 'sub_category.jpg',
                              ),
                              'category_id':
                                  addSubCategoryRequestBodyModel.categoryId,
                            },
                          );
                          context.read<SubCategoriesBloc>().add(
                                SubCategoriesEvent.add(
                                  formData: formData,
                                ),
                              );
                        } else {}
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
      ),
    );
  }
}
