import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import 'global_widgets.dart';

class CustomTextButtonWidget extends StatelessWidget {
  const CustomTextButtonWidget({
    super.key,
    required this.onPressed,
    this.text,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = AppColors.white,
    this.widget,
    this.width,
  });
  final void Function()? onPressed;
  final String? text;
  final Color buttonColor;
  final Color textColor;
  final Widget? widget;
  final double? width;
  @override
  Widget build(context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width ?? 250.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(
              5.sp,
            ),
            child: widget ??
                CustomText(
                  text: text ?? "",
                  color: textColor,
                  fontSize: 18.sp,
                  maxLines: 2,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
