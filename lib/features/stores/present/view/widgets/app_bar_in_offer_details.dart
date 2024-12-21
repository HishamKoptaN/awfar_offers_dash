// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import '../../../../../core/functions/navigation.dart';
// import '../../../../../core/widgets/custom_button.dart';
// import '../../../../../core/widgets/global_widgets.dart';
// import '../../../../../core/widgets/custom_back_button.dart';
// import '../../../../../core/widgets/custom_marka_item.dart';
// import '../../../data/models/store.dart';

// class AppBarInOfferDetails extends StatelessWidget {
//   AppBarInOfferDetails({
//     super.key,
//     required this.store,
//   });
//   Store store;

//   @override
//   Widget build(context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const CustomBackButton(),
//           CustomMarkaItem(
//             radius1: 25.sp,
//             radius2: 40.sp,
//             imageUrl: store.image ?? '',
//           ),
//           Gap(
//             15.w,
//           ),
//           CustomText(
//             text: store.name ?? '',
//             fontSize: 25.sp,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//           Gap(
//             100.w,
//           ),
       
//           const Spacer(),
//         ],
//       ),
//     );
//   }
// }
