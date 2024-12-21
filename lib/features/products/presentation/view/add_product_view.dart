import 'package:awfar_offers_dash/core/singletons/markas_singleton.dart';
import 'package:awfar_offers_dash/core/widgets/pick_image_widget.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_dropdown_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/singletons/categories_singletone.dart';
import '../../../../core/singletons/sub_categories_singletone.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../categories/data/models/category.dart';
import '../../../stores/data/models/store.dart';
import '../../../sub_categories/data/models/sub_categories_response_model.dart';
import '../../../sub_categories_items/data/models/marka.dart';
import '../bloc/products_bloc.dart';
import 'dart:typed_data';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';

class AddPrdouctView extends StatefulWidget {
  AddPrdouctView({
    super.key,
    required this.offerId,
  });

  int offerId;
  @override
  State<AddPrdouctView> createState() => _AddPrdouctViewState();
}

class _AddPrdouctViewState extends State<AddPrdouctView> {
  TextEditingController? priceController;
  TextEditingController? discountController;
  Store? selectedStore;
  Category? selectedCategory;
  SubCategory? selectedSubCategory;
  Marka? selectedSubCategoryItem;
  Uint8List? imageBytes;

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة منتج',
      body: BlocProvider(
        create: (_) => ProductsBloc(
          getProductsUseCase: getIt(),
          addProductsUseCase: getIt(),
          editUseCase: getIt(),
          deleteUseCase: getIt(),
        ),
        child: BlocConsumer<ProductsBloc, ProductsState>(
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
                      controller: priceController,
                      label: 'السعر',
                      textInputType: TextInputType.text,
                    ),
                    Gap(
                      10.h,
                    ),
                    CustomTextFormField(
                      controller: discountController,
                      label: 'نسبة الخصم',
                      textInputType: TextInputType.text,
                    ),
                    Gap(
                      10.h,
                    ),
                    CustomDropdownContainer<Category>(
                      items: CategoriesSingleton.instance.categories!,
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
                        items: SubCategoriesSingleton.instance.subCategories!
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
                              selectedSubCategoryItem = null;
                            },
                          );
                        },
                        itemLabel: (item) => item.name!,
                        fontSize: 20.sp,
                        hint: 'أختر فئة الفرعية',
                      ),
                    if (selectedCategory != null)
                      CustomDropdownContainer<Marka>(
                        height: 75.h,
                        width: 450.w,
                        items: MarkasSingleton.instance.markas
                            .where(
                              (subcategoryItem) =>
                                  subcategoryItem.subCategoryId ==
                                  selectedCategory?.id,
                            )
                            .toList(),
                        selectedItem: selectedSubCategoryItem,
                        onChanged: (value) {
                          setState(
                            () {
                              selectedSubCategoryItem = value;
                            },
                          );
                        },
                        itemLabel: (item) => item.name!,
                        fontSize: 20.sp,
                        hint: 'أختر الماركة ',
                      ),
                    Gap(
                      10.h,
                    ),
                    PickImageWidget(
                      label: "أضف صورة المنتج",
                      onImagePicked: (file) {
                        imageBytes = file;
                      },
                    ),
                    Gap(
                      10.h,
                    ),
                    CustomTextButtonWidget(
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
                        if (imageBytes != null) {
                          FormData formData = FormData.fromMap(
                            {
                              'price': priceController,
                              'discount': discountController,
                              'offer_id': widget.offerId,
                              'image': MultipartFile.fromBytes(
                                imageBytes!,
                                filename: 'prdouct_image.jpg',
                              ),
                            },
                          );
                          context.read<ProductsBloc>().add(
                                ProductsEvent.add(
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
