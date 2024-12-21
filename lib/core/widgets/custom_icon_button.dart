import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../utils/app_colors.dart';
import 'global_widgets.dart';

class CustomIconButtonWidget extends StatelessWidget {
  const CustomIconButtonWidget({
    super.key,
    required this.onPressed,
    this.text,
    this.icon = Icons.add,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = AppColors.black,
  });

  final void Function()? onPressed;
  final String? text;
  final IconData icon;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(
    context,
  ) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 75.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: buttonColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  8.sp,
                ),
                child: Icon(
                  icon,
                  color: textColor,
                  size: 30.sp,
                ),
              ),
            ),
            Gap(
              10.h,
            ),
            if (text != null)
              CustomText(
                text: text!,
                color: textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            Gap(
              10.h,
            ),
          ],
        ),
      ),
    );
  }
}
