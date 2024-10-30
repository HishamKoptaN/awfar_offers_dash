import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/global/circular_progress.dart';
import '../../../../core/global/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../countries/data/models/countries_response_model.dart';
import '../../data/models/add_category_request_body_model.dart';
import '../bloc/categories_bloc.dart';
import '../bloc/categories_event.dart';
import '../bloc/categories_state.dart';

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({
    super.key,
  });

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

Country? selectedCountry;
AddCategoryRequestBodyModel addCategoryRequestBodyModel =
    AddCategoryRequestBodyModel();

class _AddCategoryViewState extends State<AddCategoryView> {
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة فئة',
      // onPressed: () {
      //   customNavigation(
      //     context: context,
      //     path: '/',
      //   );
      // },
      body: BlocProvider(
        create: (_) => getIt<CategoriesBloc>(),
        child: BlocConsumer<CategoriesBloc, CategoriesState>(
          listener: (context, state) {
            state.whenOrNull(
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
                    content: Text(
                      error,
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
                        hintText: 'اسم الفئة',
                        textInputType: TextInputType.text,
                        onChanged: (value) {
                          addCategoryRequestBodyModel.name = value;
                        },
                      ),
                      Gap(
                        10.h,
                      ),
                      CustomTextButton(
                        text: 'أضافة',
                        onPressed: () async {
                          context.read<CategoriesBloc>().add(
                                CategoriesEvent.addCategoryEvent(
                                  addCategoryRequestBodyModel:
                                      addCategoryRequestBodyModel,
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
