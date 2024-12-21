import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_dropdown_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/singletons/categories_singletone.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/category.dart';
import '../../../sub_categories/data/models/sub_categories_response_model.dart';
import '../../../sub_categories/presentation/bloc/sub_categories_event.dart';
import '../../../sub_categories/presentation/bloc/sub_categories_state.dart';
import '../../../sub_categories/presentation/bloc/sub_categories_bloc.dart';

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
  TextEditingController? nameController;
  Category? selectedCategory;
  Uint8List? imageBytes;

  @override
  void initState() {
    super.initState();
    nameController?.text = widget.subCategory.name ?? '';
    selectedCategory = CategoriesSingleton.instance.categories?.firstWhere(
      (subCategory) => subCategory.id == widget.subCategory.categoryId,
      orElse: () => CategoriesSingleton.instance.categories!.first,
    );
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'تعديل بيانات الفئة الفرعية',
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
                    controller: nameController,
                    initialValue: widget.subCategory.name,
                    label: 'الاسم',
                    textInputType: TextInputType.text,
                    onChanged: (v) {
                      widget.subCategory = widget.subCategory.copyWith(
                        name: v,
                      );
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomDropdownContainer<Category>(
                    height: 75.h,
                    width: 450.w,
                    items: CategoriesSingleton.instance.categories!,
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
                          FormData formData = FormData.fromMap(
                            {
                              'name': widget.subCategory.name,
                              'category_id': selectedCategory?.id,
                              if (imageBytes != null)
                                'image': MultipartFile.fromBytes(
                                  imageBytes!,
                                  filename: 'sub_category.jpg',
                                ),
                            },
                          );
                          context.read<SubCategoriesBloc>().add(
                                SubCategoriesEvent.edit(
                                  formData: formData,
                                  id: widget.subCategory.id ?? 0,
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
