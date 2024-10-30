import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
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

  @override
  Widget build(context) {
    return SizedBox(
      height: 50.h,
      width: 450.w,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.white, // تغيير لون الخط هنا
          fontSize: 16.0, // حجم الخط
          fontWeight: FontWeight.normal, // وزن الخط
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
