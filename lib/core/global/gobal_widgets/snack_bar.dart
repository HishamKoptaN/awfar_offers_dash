import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'global_widgets.dart';

SnackBar snackBar({
  required bool status,
  required String message,
}) {
  return SnackBar(
    backgroundColor: status ? Colors.green : Colors.red,
    duration: const Duration(
      seconds: 3,
    ),
    content: CustomText(
      text: message,
      color: status ? Colors.white : Colors.white,
      fontSize: 22.5.sp,
      maxLines: 2,
      fontWeight: null,
    ),
  );
}
