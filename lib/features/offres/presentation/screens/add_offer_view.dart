import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
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
import '../../data/models/add_offer_request_body_model.dart';
import '../bloc/offers_event.dart';
import '../bloc/offers_state.dart';
import '../bloc/offres_bloc.dart';
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
  final stores = StoresResponseModel().stores ?? [];
  final categories = CategoriesResponseModel().categories ?? [];
  // final subCategories = SubCategoriesResponseModel().subCategories ?? [];
  final subCategories = SubCategoriesResponseModel().subCategories ?? [];
  AddOfferRequestBodyModel addOfferRequestBodyModel =
      AddOfferRequestBodyModel();
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة عرض',
      body: BlocProvider(
        create: (_) => OffersBloc(
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
            return SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      hintText: 'اسم العرض',
                      textInputType: TextInputType.text,
                      onChanged: (value) {
                        addOfferRequestBodyModel.name = value;
                      },
                    ),
                    Gap(
                      10.h,
                    ),
                    CustomDropdownContainer<Store>(
                      height: 75.h,
                      width: 450.w,
                      items: stores,
                      selectedItem: selectedStore,
                      onChanged: (value) {
                        setState(
                          () {
                            selectedStore = value;
                            addOfferRequestBodyModel.storeId =
                                value!.id!.toString();
                          },
                        );
                      },
                      itemLabel: (item) => item.name!,
                      fontSize: 20.sp,
                      hint: 'أختر المتجر صاحب العرض',
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
                        items: subCategories
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
                              addOfferRequestBodyModel.subCategoryId =
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
                            addOfferRequestBodyModel.subCategoryId != null) {
                          FormData formData = FormData.fromMap({
                            'name': addOfferRequestBodyModel.name,
                            'image': MultipartFile.fromBytes(
                              imageBytes!,
                              filename: 'offer_image.jpg',
                            ),
                            'store_id': int.tryParse(
                                  addOfferRequestBodyModel.storeId ?? '',
                                ) ??
                                0,
                            'sub_category_id':
                                addOfferRequestBodyModel.subCategoryId,
                            'description': "description",
                          });

                          // إرسال الطلب
                          context.read<OffersBloc>().add(
                                OffersEvent.addOfferEvent(
                                  formData: formData,
                                ),
                              );
                        } else {
                          // التعامل مع الحالة عندما تكون الصورة أو معرف الفئة الفرعية غير محدد
                          print('Image or sub_category_id is null');
                        }
                      },
                    ),
                    Gap(
                      10.h,
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
