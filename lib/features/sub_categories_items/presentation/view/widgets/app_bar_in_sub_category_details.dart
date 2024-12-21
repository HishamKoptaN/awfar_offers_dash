import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/widgets/global_widgets.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../sub_categories/data/models/sub_categories_response_model.dart';

class AppBarInSubCategoryDetails extends StatelessWidget {
  AppBarInSubCategoryDetails({
    super.key,
    required this.subCategory,
  });
  SubCategory subCategory;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomBackButton(),
          // CustomMarkaItem(
          //   radius1: 25.sp,
          //   radius2: 40.sp,
          //   imageUrl: category.image ?? '',
          // ),
          Gap(
            15.w,
          ),
          CustomText(
            text: subCategory.name ?? '',
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          Gap(
            100.w,
          ),
          // CustomTextButtonWidget(
          //   onPressed: () {
          //     customNavigation(
          //       context: context,
          //       path: '/AddCategoryGroupView',
          //       extra: category.id,
          //     );
          //   },
          //   text: 'أضافة مجموعة عروض',
          // ),
          const Spacer(),
        ],
      ),
    );
  }
}
