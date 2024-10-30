import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import 'gobal_widgets/global_widgets.dart';

class CustomDropdownButton extends StatefulWidget {
  CustomDropdownButton({
    super.key,
    required this.items,
    required this.selectedValue,
    this.hintText = 'أختر',
    this.labelText = 'الحاله',
    required this.onChanged,
    this.widget,
  });

  final List<DropdownMenuItem<dynamic>>? items;
  final ValueChanged<dynamic>? onChanged;
  dynamic selectedValue;
  final Widget? widget;
  final String hintText;
  final String labelText;
  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(context) {
    return Container(
      height: 50.h,
      width: 450.w,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<dynamic>(
        isExpanded: true,
        value: widget.selectedValue,
        hint: CustomText(
          text: widget.hintText,
          fontSize: 20.sp,
        ),
        onChanged: widget.onChanged,
        items: widget.items,
      ),
    );
  }
}
