import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/custom_dropdown_button.dart';
import '../../../../core/global/gobal_widgets/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/global/gobal_widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../categories/data/models/categories_response_model.dart';
import '../../../stores/data/models/stores_response_model.dart';
import '../../../sub_categories/data/models/sub_categories_response_model.dart';
import '../../data/models/edit_sub_category_request_model.dart';
import '../bloc/sub_categories_event.dart';
import '../bloc/sub_categories_state.dart';
import '../bloc/sub_categories_bloc.dart';

class EditSubCategoryView extends StatefulWidget {
  EditSubCategoryView({
    super.key,
    required this.subCategory,
  });
  SubCategory subCategory;
  @override
  State<EditSubCategoryView> createState() => _EditSubCategoryViewState();
}

class _EditSubCategoryViewState extends State<EditSubCategoryView> {
  Store? selectedStore;
  Category? selectedCategory;
  Uint8List? imageBytes;

  @override
  void initState() {
    super.initState();
    EditSubCategoryRequestBodyModel().id = widget.subCategory.id;
    EditSubCategoryRequestBodyModel().name = widget.subCategory.name;
    EditSubCategoryRequestBodyModel().categoryId =
        widget.subCategory.categoryId;
    selectedCategory = CategoriesResponseModel().categories?.firstWhere(
          (subCategory) => subCategory.id == widget.subCategory.categoryId,
          orElse: () => CategoriesResponseModel().categories!.first,
        );
    // selectedSubCategory =
    //     SubCategoriesResponseModel().subCategories?.firstWhere(
    //           (subCategory) =>
    //               subCategory.id == widget.subCategory.subCategoryId,
    //           orElse: () => selectedSubCategory!,
    //         );
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
      body: BlocConsumer<SubCategoriesBloc, SubCategoriesState>(
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
                    initialValue: widget.subCategory.name,
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      EditSubCategoryRequestBodyModel().name = value!;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomDropdownContainer<Category>(
                    height: 75.h,
                    width: 450.w,
                    items: CategoriesResponseModel().categories!,
                    selectedItem: selectedCategory,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedCategory = value;
                        },
                      );
                    },
                    itemLabel: (item) => item.name!,
                    fontSize: 20.sp,
                    hint: 'أختر الفئة التابع لها الفئة الفرعية',
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
                          setState(
                            () {
                              imageBytes = file.bytes;
                            },
                          );
                          final formData = FormData.fromMap(
                            {
                              'image': MultipartFile.fromBytes(
                                imageBytes!,
                                filename: 'offer_image.jpg',
                              ),
                            },
                          );
                          context.read<SubCategoriesBloc>().add(
                                SubCategoriesEvent.editImage(
                                  formData: formData,
                                  id: widget.subCategory.id!,
                                ),
                              );
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
                            ? CachedNetworkImage(
                                imageUrl: widget.subCategory.image!,
                                fit: BoxFit.fill,
                                placeholder: (
                                  context,
                                  url,
                                ) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (
                                  context,
                                  url,
                                  error,
                                ) =>
                                    const Icon(
                                  Icons.error,
                                ),
                              )
                            : Image.memory(
                                imageBytes!,
                              ),
                      ),
                    ),
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
                          final subCategory = SubCategory(
                            id: EditSubCategoryRequestBodyModel().id!,
                            name: EditSubCategoryRequestBodyModel().name!,
                            categoryId:
                                EditSubCategoryRequestBodyModel().categoryId!,
                          );
                          context.read<SubCategoriesBloc>().add(
                                SubCategoriesEvent.edit(
                                  subCategory: subCategory,
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
