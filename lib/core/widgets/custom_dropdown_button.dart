import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import 'global_widgets.dart';

class CustomDropdownContainer<T> extends StatelessWidget {
  const CustomDropdownContainer({
    super.key,
    this.height,
    this.width,
    required this.hint,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.itemLabel,
    this.fontSize,
  });
  final double? height;
  final double? width;
  final String hint;

  final List<T> items;
  final T? selectedItem;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemLabel;
  final double? fontSize;
  @override
  Widget build(context) {
    return Container(
      height: height ?? 75.h,
      width: width ?? 300.w,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<T>(
        isExpanded: true,
        value: selectedItem,
        onChanged: onChanged,
        dropdownColor: AppColors.primaryColor,
        hint: Align(
          alignment: Alignment.center,
          child: CustomText(
            text: hint,
            color: Colors.grey,
            fontSize: fontSize ?? 20.sp,
          ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize ?? 20.sp,
        ),
        items: items.map(
          (item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Center(
                child: CustomText(
                  text: itemLabel(
                    item,
                  ),
                  fontSize: fontSize ?? 20.sp,
                  color: Colors.white,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
