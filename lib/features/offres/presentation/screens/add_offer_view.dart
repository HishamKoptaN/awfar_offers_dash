import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/global/circular_progress.dart';
import '../../../../core/global/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
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
  Category? selectedCategory;
  AddOfferRequestBodyModel addOfferRequestBodyModel =
      AddOfferRequestBodyModel();
  final categories = CategoriesResponseModel().categories;
  final stores = StoresResponseModel().stores;
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
        create: (_) => getIt<OffersBloc>(),
        child: BlocConsumer<OffersBloc, OffersState>(
          listener: (context, state) async {
            await state.whenOrNull(
              success: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "نجاح",
                    ),
                  ),
                );
              },
              failure: (error) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: CustomText(
                      text: error.error!,
                      fontSize: 30.sp,
                    ),
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () {
                return const CustomCircularProgress();
              },
              orElse: () {
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
                        child: DropdownButton<Store>(
                          isExpanded: true,
                          value: selectedStore,
                          onChanged: (value) {
                            setState(
                              () {
                                selectedStore = value;
                                addOfferRequestBodyModel.name =
                                    value!.id!.toString();
                              },
                            );
                          },
                          items: stores!.map(
                            (country) {
                              return DropdownMenuItem<Store>(
                                value: country,
                                child: Center(
                                  child: CustomText(
                                    text: country.name!,
                                    fontSize: 20.sp,
                                    //         ),
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
                        child: DropdownButton<Category>(
                          isExpanded: true,
                          value: selectedCategory,
                          onChanged: (value) {
                            setState(
                              () {
                                selectedCategory = value;
                                addOfferRequestBodyModel.name =
                                    value!.id!.toString();
                              },
                            );
                          },
                          items: categories!.map(
                            (category) {
                              return DropdownMenuItem<Category>(
                                value: category,
                                child: Center(
                                  child: CustomText(
                                    text: category.name!,
                                    fontSize: 20.sp,
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
                      CustomTextButton(
                        text: 'أضافة',
                        onPressed: () async {
                          context.read<OffersBloc>().add(
                                OffersEvent.addOfferEvent(
                                  addOfferRequestBodyModel:
                                      addOfferRequestBodyModel,
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
