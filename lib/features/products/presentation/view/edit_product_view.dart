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
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/product.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_state.dart';

class EditPrdouctView extends StatefulWidget {
  EditPrdouctView({
    super.key,
    required this.product,
  });
  Product product;

  @override
  State<EditPrdouctView> createState() => _EditPrdouctViewState();
}

class _EditPrdouctViewState extends State<EditPrdouctView> {
  Uint8List? imageBytes;
  Product? selectedPrdouct;

  @override
  void initState() {
    super.initState();
    selectedPrdouct = widget.product;
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
      body: BlocConsumer<ProductsBloc, ProductsState>(
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
                    initialValue: widget.product.id.toString(),
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      // EditPrdouctRequestBodyModel().name = value!;
                    },
                  ),
                  Gap(
                    10.h,
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
                                filename: 'prdouct_image.jpg',
                              ),
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
                                imageUrl: widget.product.image!,
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
                          // final formattedEndAt =
                          //     DateFormat('dd/MM/yyyy').format(
                          //   EditPrdouctRequestBodyModel().endAt!,
                          // );
                          // final prdouct = Prdouct(
                          //   id: EditPrdouctRequestBodyModel().id!,
                          //   name: EditPrdouctRequestBodyModel().name!,
                          //   endAt: formattedEndAt,
                          //   storeId: EditPrdouctRequestBodyModel().storeId!,
                          //   subCategoryId:
                          //       EditPrdouctRequestBodyModel().subCategoryId!,
                          //   description: "description",
                          // );
                          // context.read<ProductsBloc>().add(
                          //       ProductsEvent.edit(
                          //         prdouct: prdouct,
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
