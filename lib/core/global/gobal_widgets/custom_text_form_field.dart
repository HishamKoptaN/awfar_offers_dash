import 'package:awfar_offers_dash/core/global/gobal_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText = "",
    this.initialValue = "",
    this.label = "",
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.controller,
    this.onChanged,
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged;
  final String? initialValue;
  final String label;
  @override
  Widget build(context) {
    return SizedBox(
      height: 50.h,
      width: 450.w,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        initialValue: initialValue,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
        ),
        obscureText: obscureText,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
          label: CustomText(
            text: label,
            fontSize: 20.sp,
            color: Colors.white70,
          ),
          filled: true,
          fillColor: AppColors.primaryColor,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyles.bold13.copyWith(
            color: const Color(
              0xFF949D9E,
            ),
          ),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.primaryColor,
      ),
    );
  }
}
