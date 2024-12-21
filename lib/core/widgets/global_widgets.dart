import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color = AppColors.black,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.fontFamily,
  });
  String text;
  double fontSize;
  Color? color;
  int? maxLines;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  String? fontFamily;
  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      textAlign: textAlign,
    );
  }
}
