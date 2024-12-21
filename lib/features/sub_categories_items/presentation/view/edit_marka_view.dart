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
import '../../../../core/utils/app_colors.dart';
import '../../data/models/marka.dart';
import '../bloc/markas_bloc.dart';
import '../bloc/markas_event.dart';
import '../bloc/markas_state.dart';

class EditMarkaView extends StatefulWidget {
  EditMarkaView({
    super.key,
    required this.marka,
  });
  Marka marka;

  @override
  State<EditMarkaView> createState() => _EditMarkaViewState();
}

class _EditMarkaViewState extends State<EditMarkaView> {
  Marka? selectedSubMarka;
  Uint8List? imageBytes;
  Marka? marka;
  @override
  void initState() {
    super.initState();
    marka = widget.marka;
  }

  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'تعديل بيانات الماركة',
      body: BlocBuilder<MarkasBloc, MarkasState>(
        builder: (context, state) {
          return SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    label: 'الاسم',
                    initialValue: widget.marka.name,
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      marka = marka?.copyWith(
                        name: value,
                      );
                    },
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
                          marka = marka?.copyWith(
                            id: widget.marka.id,
                          );
                          context.read<MarkasBloc>().add(
                                MarkasEvent.edit(
                                  marka: marka!,
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
