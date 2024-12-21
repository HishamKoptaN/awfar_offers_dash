import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../../../core/app_layout.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_dropdown_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../../core/singletons/stores_singleton.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../core/singletons/categories_singletone.dart';
import '../../../../core/singletons/sub_categories_singletone.dart';
import '../../../categories/data/models/category.dart';
import '../../../stores/data/models/store.dart';
import '../../../sub_categories/data/models/sub_categories_response_model.dart';
import '../../data/models/offer_group.dart';
import '../bloc/offer_groups_bloc.dart';
import '../bloc/offer_groups_state.dart';

class EditOfferGroupView extends StatefulWidget {
  EditOfferGroupView({
    super.key,
    required this.offerGroup,
  });
  OfferGroup offerGroup;

  @override
  State<EditOfferGroupView> createState() => _EditOfferGroupViewState();
}

class _EditOfferGroupViewState extends State<EditOfferGroupView> {
  Store? selectedStore;
  SubCategory? selectedSubCategory;
  Category? selectedCategory;
  Uint8List? imageBytes;
  OfferGroup? selectedOfferGroup;
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat(
      'dd/MM/yyyy',
    );
    return formatter.format(date);
  }

  @override
  void initState() {
    super.initState();
    // EditOfferGroupRequestBodyModel().id = widget.offer.id;
    // EditOfferGroupRequestBodyModel().name = widget.offer.name;
    // EditOfferGroupRequestBodyModel().storeId = widget.offer.storeId;
    // EditOfferGroupRequestBodyModel().subCategoryId = widget.offer.subCategoryId;
    selectedOfferGroup = widget.offerGroup;
    selectedStore = StoresSingleton.instance.stores.firstWhere(
      (store) => store.id == widget.offerGroup.storeId,
      orElse: () => StoresSingleton.instance.stores.first,
    );
    // selectedCategory = CategoriesResponseModel().categories?.firstWhere(
    //       (subCategory) => subCategory.id == widget.offer.subCategoryId,
    //       orElse: () => CategoriesResponseModel().categories!.first,
    //     );
    // selectedSubCategory =
    //     SubCategoriesResponseModel().subCategories?.firstWhere(
    //           (subCategory) => subCategory.id == widget.offer.subCategoryId,
    //           orElse: () => selectedSubCategory!,
    //         );
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
      body: BlocConsumer<OfferGroupsBloc, OfferGroupsState>(
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
                    initialValue: widget.offerGroup.name,
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      //  EditOfferGroupRequestBodyModel().name = value!;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  // CustomTextFormField(
                  //   label: 'الاسم',
                  //   initialValue: widget.offer.name,
                  //   textInputType: TextInputType.text,
                  //   onChanged: (value) {
                  //     ?EditOfferGroupRequestBodyModel().name = value!;
                  //   },
                  // ),
                  Gap(
                    10.h,
                  ),
                  // CustomDateWidget(
                  //   widget: CustomText(
                  //     text: EditOfferGroupRequestBodyModel().endAt != null
                  //         ? formatDate(EditOfferGroupRequestBodyModel().endAt!)
                  //         : "تاريخ انتهاء العرض",
                  //     fontSize: 20.sp,
                  //     color: AppColors.white,
                  //     maxLines: 1,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   onPressed: () async {
                  //     final DateTime? picked = await showDatePicker(
                  //       context: context,
                  //       initialDate: DateTime.now(),
                  //       firstDate: DateTime(2000),
                  //       lastDate: DateTime(2101),
                  //     );
                  //     EditOfferGroupRequestBodyModel().endAt = picked;
                  //   },
                  // ),
                  Gap(
                    10.h,
                  ),
                  CustomDropdownContainer<Store>(
                    height: 75.h,
                    width: 450.w,
                    items: StoresSingleton.instance.stores,
                    selectedItem: selectedStore,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedStore = value;
                          // EditOfferGroupRequestBodyModel().subCategoryId =
                          //     value!.id;
                        },
                      );
                    },
                    itemLabel: (item) => item.name ?? "",
                    fontSize: 20.sp,
                    hint: 'أختر المتجر صاحب العرض',
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
                    hint: 'أختر الفئة',
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomDropdownContainer<SubCategory>(
                    height: 75.h,
                    width: 450.w,
                    items: SubCategoriesSingleton.instance.subCategories!
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
                          // EditOfferGroupRequestBodyModel().subCategoryId =
                          //     value!.id;
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
                          // final formattedEndAt =
                          //     DateFormat('dd/MM/yyyy').format(
                          //   EditOfferGroupRequestBodyModel().endAt!,
                          // );
                          // final offer = OfferGroup(
                          //   id: EditOfferGroupRequestBodyModel().id!,
                          //   name: EditOfferGroupRequestBodyModel().name!,
                          //   endAt: formattedEndAt,
                          //   storeId: EditOfferGroupRequestBodyModel().storeId!,
                          //   subCategoryId:
                          //       EditOfferGroupRequestBodyModel().subCategoryId!,
                          //   description: "description",
                          // );
                          // context.read<OfferGroupsBloc>().add(
                          //       OfferGroupsEvent.edit(
                          //         offer: offer,
                          //       ),
                          //     );
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
