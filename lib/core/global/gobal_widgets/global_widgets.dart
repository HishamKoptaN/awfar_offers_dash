import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color = AppColors.white,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
  });
  String text;
  double fontSize;
  Color? color;
  int? maxLines;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      textAlign: textAlign,
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    this.text,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = AppColors.white,
    this.widget,
  });
  final void Function()? onPressed;
  final String? text;
  final Color buttonColor;
  final Color textColor;

  final Widget? widget;
  @override
  Widget build(context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 300.w,
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
                  fontSize: 30.sp,
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
