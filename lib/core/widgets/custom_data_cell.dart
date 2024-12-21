import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'global_widgets.dart';

DataCell customDataCell({
  required String label,
}) {
  return DataCell(
    CustomText(
      text: label,
      fontSize: 22.5.sp,
    ),
  );
}
