import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/custom_dropdown_button.dart';
import '../../../../core/global/gobal_widgets/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../../core/global/gobal_widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../countries/data/models/countries_response_model.dart';
import '../../../governorates/data/models/governorates_response_model.dart';
import '../../../stores/data/models/stores_response_model.dart';
import '../../../sub_categories/data/models/sub_categories_response_model.dart';
import '../../data/models/edit_store_request_model.dart';
import '../bloc/stores_bloc.dart';
import '../bloc/stores_event.dart';
import '../bloc/stores_state.dart';

class EditStoreView extends StatefulWidget {
  EditStoreView({
    super.key,
    required this.store,
  });
  Store store;

  @override
  State<EditStoreView> createState() => _EditStoreViewState();
}

class _EditStoreViewState extends State<EditStoreView> {
  Country? selectedCountry;
  Governorate? selectedGovernorate;

  final countries = CountriesResponseModel().countries;
  final governorates = GovernoratesResponseModel().governorates;
  Uint8List? imageBytes;
  Store? selectedStore;
  @override
  void initState() {
    super.initState();
    EditStoreRequestBodyModel().id = widget.store.id;
    EditStoreRequestBodyModel().name = widget.store.name;
    EditStoreRequestBodyModel().countryId = widget.store.countryId;
    EditStoreRequestBodyModel().governorateId = widget.store.governorateId;
    EditStoreRequestBodyModel().place = widget.store.place;
    selectedStore = widget.store;
    selectedCountry = countries?.firstWhere(
      (country) => country.id == widget.store.countryId,
      orElse: () => countries!.first,
    );
    selectedGovernorate = governorates?.firstWhere(
      (governorate) => governorate.id == widget.store.governorateId,
      orElse: () => governorates!.first,
    );
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'تعديل بيانات العلامة التجارية',
      // onPressed: () {
      //   customNavigation(
      //     context: context,
      //     path: '/',
      //   );
      // },
      body: BlocConsumer<StoresBloc, StoresState>(
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
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    initialValue: widget.store.name,
                    hintText: 'اسم العلامه التجارية',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      EditStoreRequestBodyModel().name = value!;
                    },
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextFormField(
                    initialValue: widget.store.place,
                    hintText: 'العنوان',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      EditStoreRequestBodyModel().place = value!;
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
                    child: DropdownButton<Country>(
                      isExpanded: true,
                      value: selectedCountry,
                      onChanged: (value) {
                        setState(
                          () {
                            selectedCountry = value;
                            selectedGovernorate = null;
                            EditStoreRequestBodyModel().countryId = value!.id;
                          },
                        );
                      },
                      items: countries!.map(
                        (country) {
                          return DropdownMenuItem<Country>(
                            value: country,
                            child: Center(
                              child: Flag.fromString(
                                country.code!,
                                height: 50.h,
                                width: 100.w,
                                fit: BoxFit.fill,
                                replacement: Flag.fromString(
                                  country.code!,
                                  height: 50.h,
                                  width: 100.w,
                                  fit: BoxFit.fill,
                                  replacement: CustomText(
                                    text: country.code ?? 'أختر الدوله',
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                  ),
                                ),
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
                  CustomDropdownContainer<Governorate>(
                    height: 75.h,
                    width: 450.w,
                    items: governorates!
                        .where(
                          (governorate) =>
                              governorate.countryId == selectedCountry?.id,
                        )
                        .toList(),
                    selectedItem: selectedGovernorate,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedGovernorate = value;
                          EditStoreRequestBodyModel().governorateId =
                              value!.id!;
                        },
                      );
                    },
                    itemLabel: (item) => item.name!,
                    fontSize: 20.sp,
                    hint: 'أختر المحافظة ',
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
                          context.read<StoresBloc>().add(
                                StoresEvent.editImage(
                                  formData: formData,
                                  id: widget.store.id,
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
                                imageUrl: widget.store.image,
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
                          final store = Store(
                            id: EditStoreRequestBodyModel().id!,
                            name: EditStoreRequestBodyModel().name!,
                            countryId: EditStoreRequestBodyModel().countryId!,
                            governorateId:
                                EditStoreRequestBodyModel().governorateId!,
                            place: EditStoreRequestBodyModel().place!,
                          );

                          context.read<StoresBloc>().add(
                                StoresEvent.edit(
                                  store: store,
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
