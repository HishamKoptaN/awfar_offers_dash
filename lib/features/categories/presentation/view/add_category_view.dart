import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../countries/data/models/countries_res_model.dart';
import '../../data/models/add_category_req_body_model.dart';
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

AddCategoryReqBodyModel addCategoryReqBodyModel = AddCategoryReqBodyModel();

class _AddCategoryViewState extends State<AddCategoryView> {
  Country? selectedCountry;
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة فئة',
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    hintText: 'اسم الفئة',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      addCategoryReqBodyModel =
                          addCategoryReqBodyModel.copyWith(
                        name: value,
                      );
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        );
                      },
                    ),
                    onPressed: () async {
                      context.read<CategoriesBloc>().add(
                            CategoriesEvent.add(
                              addCategoryReqBodyModel: addCategoryReqBodyModel,
                            ),
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
