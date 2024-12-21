import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../sub_categories/presentation/bloc/sub_categories_bloc.dart';
import '../../../sub_categories/presentation/bloc/sub_categories_event.dart';
import '../../../sub_categories/presentation/bloc/sub_categories_state.dart';

class AddSubCategoryView extends StatefulWidget {
  const AddSubCategoryView({
    super.key,
    required this.categoryId,
  });
  final int categoryId;
  @override
  State<AddSubCategoryView> createState() => _AddSubCategoryViewState();
}

class _AddSubCategoryViewState extends State<AddSubCategoryView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? nameController;
  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة فئة فرعية',
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
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      onChanged: (value) {
                        nameController = value ?? "";
                      },
                      hintText: 'اسم الفئة الفرعية',
                      textInputType: TextInputType.text,
                    ),
                    Gap(10.h),
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
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.cloudArrowUp,
                                    ),
                                    Text("أضف صورة للعرض"),
                                    Gap(20),
                                  ],
                                )
                              : Image.memory(
                                  imageBytes!,
                                ),
                        ),
                      ),
                    ),
                    if (imageBytes == null)
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          'يرجى اختيار صورة',
                          style: TextStyle(color: Colors.red, fontSize: 16.sp),
                        ),
                      ),
                    Gap(10.h),
                    CustomTextButtonWidget(
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
                        if (_formKey.currentState?.validate() ?? false) {
                          if (imageBytes != null) {
                            FormData formData = FormData.fromMap(
                              {
                                'name': nameController,
                                'image': MultipartFile.fromBytes(
                                  imageBytes!,
                                  filename: 'sub_category.jpg',
                                ),
                                'category_id': widget.categoryId,
                              },
                            );
                            context.read<SubCategoriesBloc>().add(
                                  SubCategoriesEvent.add(
                                    formData: formData,
                                  ),
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              snackBar(
                                status: false,
                                message: 'يرجى اختيار صورة',
                              ),
                            );
                          }
                        }
                      },
                    ),
                    Gap(50.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
