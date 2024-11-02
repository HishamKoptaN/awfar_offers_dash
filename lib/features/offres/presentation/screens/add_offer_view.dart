import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/global/custom_circular_progress.dart';
import '../../../../core/global/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/global/gobal_widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../categories/data/models/categories_response_model.dart';
import '../../../stores/data/models/stores_response_model.dart';
import '../../data/models/add_offer_request_body_model.dart';
import '../bloc/offers_event.dart';
import '../bloc/offers_state.dart';
import '../bloc/offres_bloc.dart';

class AddOfferView extends StatefulWidget {
  const AddOfferView({
    super.key,
  });

  @override
  State<AddOfferView> createState() => _AddOfferViewState();
}

class _AddOfferViewState extends State<AddOfferView> {
  Store? selectedStore;
  File file = File("");

  Category? selectedCategory;
  AddOfferRequestBodyModel addOfferRequestBodyModel =
      AddOfferRequestBodyModel();
  final categories = CategoriesResponseModel().categories ?? [];
  final stores = StoresResponseModel().stores ?? [];
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة عرض',
      // onPressed: () {
      //   customNavigation(
      //     context: context,
      //     path: '/',
      //   );
      // },
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
            return Center(
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
                  Container(
                    height: 75.h,
                    width: 450.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: DropdownButton<Store>(
                        isExpanded: true,
                        value: selectedStore,
                        onChanged: (value) {
                          setState(
                            () {
                              selectedStore = value;
                              addOfferRequestBodyModel.storeId =
                                  value!.id!.toString();
                            },
                          );
                        },
                        dropdownColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        items: stores.map(
                          (store) {
                            return DropdownMenuItem<Store>(
                              value: store,
                              child: Center(
                                child: CustomText(
                                  text: store.name!,
                                  fontSize: 20.sp, color: Colors.black,
                                  //         ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                  Gap(
                    10.h,
                  ),
                  Container(
                    height: 75.h,
                    width: 450.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<Category>(
                      isExpanded: true,
                      value: selectedCategory,
                      onChanged: (value) {
                        setState(
                          () {
                            selectedCategory = value;
                            addOfferRequestBodyModel.categoryId =
                                value!.id!.toString();
                          },
                        );
                      },
                      dropdownColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      items: categories.map(
                        (category) {
                          return DropdownMenuItem<Category>(
                            value: category,
                            child: Center(
                              child: CustomText(
                                text: category.name!,
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
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
                          File file = File(
                            result.files.single.path!,
                          );
                          await addOfferRequestBodyModel.setImageFile(
                            file,
                          );
                          setState(
                            () {
                              this.file = file;
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
                        child: file.path.isEmpty
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
                            : Image.file(
                                file,
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
                          fontWeight: FontWeight.bold,
                        );
                      },
                    ),
                    onPressed: () async {
                      FormData formData = FormData.fromMap(
                        {
                          'name': addOfferRequestBodyModel.name,
                          'image': await MultipartFile.fromFile(
                            file.path,
                            filename: file.path.split('/').last,
                          ),
                          'store_id': int.tryParse(
                                addOfferRequestBodyModel.storeId ?? '',
                              ) ??
                              0,
                          'category_id': addOfferRequestBodyModel.categoryId,
                          'description': "description",
                        },
                      );
                      context.read<OffersBloc>().add(
                            OffersEvent.addOfferEvent(
                              formData: formData,
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
