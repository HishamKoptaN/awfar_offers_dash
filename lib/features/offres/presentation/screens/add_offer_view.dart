import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/custom_date_widget.dart';
import '../../../../core/global/gobal_widgets/custom_dropdown_button.dart';
import '../../../../core/global/gobal_widgets/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/global/gobal_widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../categories/data/models/categories_response_model.dart';
import '../../../stores/data/models/stores_response_model.dart';
import '../../../sub_categories/data/models/sub_categories_response_model.dart';
import '../../data/models/add_offer_request_body_model.dart';
import '../bloc/offers_event.dart';
import '../bloc/offers_state.dart';
import '../bloc/offers_bloc.dart';
import 'dart:typed_data';

class AddOfferView extends StatefulWidget {
  const AddOfferView({
    super.key,
  });
  @override
  State<AddOfferView> createState() => _AddOfferViewState();
}

class _AddOfferViewState extends State<AddOfferView> {
  Store? selectedStore;
  Category? selectedCategory;
  SubCategory? selectedSubCategory;
  Uint8List? imageBytes;

// دالة لتنسيق التاريخ بالشكل المطلوب
  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة عرض',
      body: BlocProvider(
        create: (_) => OffersBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
        child: BlocConsumer<OffersBloc, OffersState>(
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
            return SizedBox.expand(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomTextFormField(
                      label: 'اسم العرض',
                      textInputType: TextInputType.text,
                      onChanged: (value) {
                        AddOfferRequestBodyModel().name = value;
                      },
                    ),
                    Gap(
                      10.h,
                    ),
                    CustomDateWidget(
                      widget: CustomText(
                        text: AddOfferRequestBodyModel().endAt != null
                            ? formatDate(AddOfferRequestBodyModel().endAt!)
                                .toString()
                            : "تاريخ انتهاء العرض",
                        fontSize: 20.sp,
                        color: AppColors.white,
                        maxLines: 1,
                        fontWeight: FontWeight.bold,
                      ),
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null &&
                            picked != AddOfferRequestBodyModel().endAt) {
                          setState(() {
                            AddOfferRequestBodyModel().endAt = picked;
                          });
                        }
                      },
                    ),
                    Gap(
                      10.h,
                    ),
                    CustomDropdownContainer<Store>(
                      height: 75.h,
                      width: 450.w,
                      items: StoresResponseModel().stores!,
                      selectedItem: selectedStore,
                      onChanged: (value) {
                        setState(
                          () {
                            selectedStore = value;
                            AddOfferRequestBodyModel().storeId =
                                value!.id.toString();
                          },
                        );
                      },
                      itemLabel: (item) => item.name,
                      fontSize: 20.sp,
                      hint: 'أختر المتجر صاحب العرض',
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
                            selectedSubCategory = null;
                          },
                        );
                      },
                      itemLabel: (item) => item.name!,
                      fontSize: 20.sp,
                      hint: 'أختر الفئة',
                    ),
                    Gap(
                      10.h,
                    ),
                    if (selectedCategory != null)
                      CustomDropdownContainer<SubCategory>(
                        height: 75.h,
                        width: 450.w,
                        items: SubCategoriesResponseModel()
                            .subCategories!
                            .where(
                              (subcategory) =>
                                  subcategory.categoryId ==
                                  selectedCategory?.id,
                            )
                            .toList(),
                        selectedItem: selectedSubCategory,
                        onChanged: (value) {
                          setState(
                            () {
                              selectedSubCategory = value;
                              AddOfferRequestBodyModel().subCategoryId =
                                  selectedCategory?.id?.toString();
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
                      height: 200,
                      width: 450,
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
                          height: 100,
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
                                    Icon(Icons.cloud_upload),
                                    Text("أضف صورة للعرض"),
                                    SizedBox(height: 20),
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
                            maxLines: 1,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          );
                        },
                      ),
                      onPressed: () async {
                        if (imageBytes != null &&
                            AddOfferRequestBodyModel().subCategoryId != null) {
                          FormData formData = FormData.fromMap({
                            'name': AddOfferRequestBodyModel().name,
                            'end_date': DateFormat('dd/MM/yyyy').format(
                              AddOfferRequestBodyModel().endAt!,
                            ),
                            'image': MultipartFile.fromBytes(
                              imageBytes!,
                              filename: 'offer_image.jpg',
                            ),
                            'store_id': int.tryParse(
                                  AddOfferRequestBodyModel().storeId ?? '',
                                ) ??
                                0,
                            'sub_category_id':
                                AddOfferRequestBodyModel().subCategoryId,
                            'description': "description",
                          });
                          context.read<OffersBloc>().add(
                                OffersEvent.add(
                                  formData: formData,
                                ),
                              );
                        }
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
