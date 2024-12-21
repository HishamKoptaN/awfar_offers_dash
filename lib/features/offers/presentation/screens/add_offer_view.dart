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
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../categories/data/models/category.dart';
import '../../../stores/data/models/store.dart';
import '../../../sub_categories/data/models/sub_categories_response_model.dart';
import '../../data/models/add_offer_request_body_model.dart';
import '../bloc/offers_event.dart';
import '../bloc/offers_state.dart';
import '../bloc/offers_bloc.dart';
import 'dart:typed_data';

class AddOfferView extends StatefulWidget {
  AddOfferView({
    super.key,
    required this.offerGroupId,
  });
  int offerGroupId;
  @override
  State<AddOfferView> createState() => _AddOfferViewState();
}

class _AddOfferViewState extends State<AddOfferView> {
  Store? selectedStore;
  Category? selectedCategory;
  SubCategory? selectedSubCategory;
  Uint8List? imageBytes;
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
                    Gap(
                      10.h,
                    ),
                    Gap(
                      10.h,
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
                            setState(
                              () {
                                imageBytes = file.bytes;
                              },
                            );
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
                        if (imageBytes != null &&
                            AddOfferRequestBodyModel().subCategoryId != null) {
                          FormData formData = FormData.fromMap(
                            {
                              'image': MultipartFile.fromBytes(
                                imageBytes!,
                                filename: 'offer_image.jpg',
                              ),
                              'offer_group_id': widget.offerGroupId
                            },
                          );
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
