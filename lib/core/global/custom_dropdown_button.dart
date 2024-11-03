import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import 'gobal_widgets/global_widgets.dart';

class CustomDropdownContainer<T> extends StatelessWidget {
  CustomDropdownContainer({
    super.key,
    required this.height,
    required this.width,
    required this.hint,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.itemLabel,
    this.fontSize = 20,
  });
  final double height;
  final double width;
  final String hint;
  final List<T> items;
  final T? selectedItem;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemLabel;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
          child: Text(
            hint,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize.sp,
        ),
        items: items.map(
          (item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Center(
                child: CustomText(
                  text: itemLabel(item),
                  fontSize: fontSize,
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
