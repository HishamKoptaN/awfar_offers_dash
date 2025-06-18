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
import '../../../../core/singletons/cities_singleton.dart';
import '../../../../core/singletons/countries_singleton.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../cities/data/models/cities_res_model.dart';
import '../../../countries/data/models/countries_res_model.dart';
import '../../data/models/store.dart';
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
  final countries = CountriesSingleton.instance.countries;
  final cities = CitiesSingleton.instance.cities;
  Country? selectedCountry;
  City? selectedGovernorate;
  Uint8List? image;
  @override
  void initState() {
    super.initState();
    selectedGovernorate = cities.firstWhere(
      (governorate) => governorate.id == widget.store.cityId,
      orElse: () => cities.first,
    );
    selectedCountry = countries.firstWhere(
      (country) => country.id == widget.store.cityId,
      orElse: () => countries.first,
    );
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'تعديل بيانات العلامة التجارية',
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
                      widget.store = widget.store.copyWith(
                        name: value,
                      );
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
                      widget.store = widget.store.copyWith(
                        place: value,
                      );
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
                          },
                        );
                      },
                      items: countries.map(
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
                  Container(
                    height: 75.h,
                    width: 450.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<City>(
                      isExpanded: true,
                      value: selectedGovernorate,
                      onChanged: (value) {
                        setState(
                          () {
                            selectedGovernorate = value;
                          },
                        );
                      },
                      items: cities.map(
                        (governorate) {
                          return DropdownMenuItem<City>(
                            value: governorate,
                            child: Center(
                                child: CustomText(
                              text: governorate.name ?? '',
                              fontSize: 15.sp,
                            )),
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
                          final file = result.files.single;
                          setState(
                            () {
                              image = file.bytes;
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
                        child: image == null
                            ? CachedNetworkImage(
                                imageUrl: widget.store.image!,
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
                                image!,
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
                          FormData formData = FormData.fromMap(
                            {
                              'name': widget.store.name,
                              'place': widget.store.place,
                              'governorate_id': selectedGovernorate?.id,
                              if (image != null)
                                'image': MultipartFile.fromBytes(
                                  image!,
                                  filename: 'sub_category.jpg',
                                ),
                            },
                          );
                          context.read<StoresBloc>().add(
                                StoresEvent.edit(
                                  id: widget.store.id!,
                                  formData: formData,
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
