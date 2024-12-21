import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import 'global_widgets.dart';

class CustomDateWidget extends StatelessWidget {
  const CustomDateWidget({
    super.key,
    required this.onPressed,
    this.text,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = AppColors.white,
    this.widget,
    this.width = 225,
  });
  final void Function()? onPressed;
  final String? text;
  final Color buttonColor;
  final Color textColor;
  final double width;
  final Widget? widget;
  @override
  Widget build(context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 50.h,
        width: 450.w,
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
                  fontSize: 20.sp,
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
//  CustomDateWidget(
//                       widget: CustomText(
//                         text: AddOfferRequestBodyModel().endAt != null
//                             ? formatDate(AddOfferRequestBodyModel().endAt!)
//                                 .toString()
//                             : "تاريخ انتهاء العرض",
//                         fontSize: 20.sp,
//                         color: AppColors.white,
//                         maxLines: 1,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       onPressed: () async {
//                         final DateTime? picked = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2101),
//                         );
//                         if (picked != null &&
//                             picked != AddOfferRequestBodyModel().endAt) {
//                           setState(() {
//                             AddOfferRequestBodyModel().endAt = picked;
//                           });
//                         }
//                       },
//                     ),