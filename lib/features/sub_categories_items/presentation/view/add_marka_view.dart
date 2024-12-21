import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/global_widgets.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../countries/data/models/countries_res_model.dart';
import '../../data/models/add_marka_req_body_model.dart';
import '../bloc/markas_bloc.dart';
import '../bloc/markas_event.dart';
import '../bloc/markas_state.dart';

class AddMarkaView extends StatefulWidget {
  AddMarkaView({
    super.key,
    required this.subCategoryId,
  });
  int subCategoryId;
  @override
  State<AddMarkaView> createState() => _AddMarkaViewState();
}

Country? selectedCountry;
AddMarkaReqBodyModel addMarkaReqBodyModel = const AddMarkaReqBodyModel();

class _AddMarkaViewState extends State<AddMarkaView> {
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة ماركة',
      body: BlocConsumer<MarkasBloc, MarkasState>(
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
                  message: apiErrorModel,
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
                    hintText: 'اسم الماركة',
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      addMarkaReqBodyModel = addMarkaReqBodyModel.copyWith(
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
                      addMarkaReqBodyModel = addMarkaReqBodyModel.copyWith(
                        subCategoryId: widget.subCategoryId,
                      );
                      context.read<MarkasBloc>().add(
                            MarkasEvent.add(
                              addMarkaReqBodyModel: addMarkaReqBodyModel,
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
