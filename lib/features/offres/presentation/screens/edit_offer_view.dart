import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../../core/app_layout.dart';
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
import '../../data/models/edit_offer_request_model.dart';
import '../../data/models/offers_response_model.dart';
import '../bloc/offers_event.dart';
import '../bloc/offers_state.dart';
import '../bloc/offers_bloc.dart';

class EditOfferView extends StatefulWidget {
  EditOfferView({
    super.key,
    required this.offer,
  });
  Offer offer;

  @override
  State<EditOfferView> createState() => _EditOfferViewState();
}

class _EditOfferViewState extends State<EditOfferView> {
  Store? selectedStore;
  SubCategory? selectedSubCategory;
  Category? selectedCategory;
  Uint8List? imageBytes;
  Offer? selectedOffer;
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat(
      'dd/MM/yyyy',
    );
    return formatter.format(date);
  }

  @override
  void initState() {
    super.initState();
    EditOfferRequestBodyModel().id = widget.offer.id;
    EditOfferRequestBodyModel().name = widget.offer.name;
    EditOfferRequestBodyModel().storeId = widget.offer.storeId;
    EditOfferRequestBodyModel().subCategoryId = widget.offer.subCategoryId;
    selectedOffer = widget.offer;
    selectedStore = StoresResponseModel().stores?.firstWhere(
          (store) => store.id == widget.offer.storeId,
          orElse: () => StoresResponseModel().stores!.first,
        );
    selectedCategory = CategoriesResponseModel().categories?.firstWhere(
          (subCategory) => subCategory.id == widget.offer.subCategoryId,
          orElse: () => CategoriesResponseModel().categories!.first,
        );
    selectedSubCategory =
        SubCategoriesResponseModel().subCategories?.firstWhere(
              (subCategory) => subCategory.id == widget.offer.subCategoryId,
              orElse: () => selectedSubCategory!,
            );
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'تعديل بيانات العرض',
      // onPressed: () {
      //   customNavigation(
      //     context: context,
      //     path: '/',
      //   );
      // },
      body: BlocConsumer<OffersBloc, OffersState>(
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
                    label: 'معرف العرض',
                    initialValue: widget.offer.name,
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      EditOfferRequestBodyModel().name = value!;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextFormField(
                    label: 'الاسم',
                    initialValue: widget.offer.name,
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      EditOfferRequestBodyModel().name = value!;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomDateWidget(
                    widget: CustomText(
                      text: EditOfferRequestBodyModel().endAt != null
                          ? formatDate(EditOfferRequestBodyModel().endAt!)
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
                      EditOfferRequestBodyModel().endAt = picked;
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
                          EditOfferRequestBodyModel().subCategoryId = value!.id;
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
                  CustomDropdownContainer<SubCategory>(
                    height: 75.h,
                    width: 450.w,
                    items: SubCategoriesResponseModel()
                        .subCategories!
                        .where(
                          (subcategory) =>
                              subcategory.categoryId == selectedCategory?.id,
                        )
                        .toList(),
                    selectedItem: selectedSubCategory,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedSubCategory = value;
                          EditOfferRequestBodyModel().subCategoryId = value!.id;
                        },
                      );
                    },
                    itemLabel: (item) => item.name!,
                    fontSize: 20.sp,
                    hint: 'أختر الفئة الفرعية',
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
                          context.read<OffersBloc>().add(
                                OffersEvent.editImage(
                                  formData: formData,
                                  id: widget.offer.id,
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
                                imageUrl: widget.offer.image,
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
                          final formattedEndAt =
                              DateFormat('dd/MM/yyyy').format(
                            EditOfferRequestBodyModel().endAt!,
                          );
                          final offer = Offer(
                            id: EditOfferRequestBodyModel().id!,
                            name: EditOfferRequestBodyModel().name!,
                            endAt: formattedEndAt,
                            storeId: EditOfferRequestBodyModel().storeId!,
                            subCategoryId:
                                EditOfferRequestBodyModel().subCategoryId!,
                            description: "description",
                          );
                          context.read<OffersBloc>().add(
                                OffersEvent.edit(
                                  offer: offer,
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
