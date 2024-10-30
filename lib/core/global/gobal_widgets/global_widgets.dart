import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  Color? color;
  int? maxLines;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
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
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final Color? buttonColor;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomText(
            text: text,
            color: color,
            fontSize: 30.sp,
            maxLines: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
