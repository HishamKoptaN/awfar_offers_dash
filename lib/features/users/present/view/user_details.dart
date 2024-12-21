import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/user.dart';
import '../../../../core/widgets/app_layout.dart';

class UserDetailsView extends StatelessWidget {
  final User user;
  const UserDetailsView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      route: 'بيانات المستخدم',
      showAppBar: true,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 125.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              // buildDetailRow(title: 'الحالة', value: user.status.toString()),
              // buildDetailRow(title: 'المعرف', value: user.id.toString()),
              // buildDetailRow(title: 'الاسم', value: user.name!),
              // buildDetailRow(title: 'الايميل', value: user.email.toString()),
              // buildDetailRow(title: 'الرصيد', value: user.balance.toString()),
              // buildDetailRow(
              //     title: 'رقم التليفون', value: user.phone.toString()),
              // buildDetailRow(title: 'الدولة', value: user.address.toString()),
              // buildDetailRow(
              //     title: 'تاريخ الانشاء', value: user.createdAt.toString()),
              // buildDetailRow(title: 'الخطة', value: user.planId.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
