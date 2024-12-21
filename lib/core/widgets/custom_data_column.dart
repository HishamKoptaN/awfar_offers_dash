import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global_widgets.dart';

DataColumn customDataColumn({required String label}) {
  return DataColumn(
    label: CustomText(
      text: label,
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}
