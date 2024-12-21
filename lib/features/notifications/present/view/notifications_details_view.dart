// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../bloc/tasks_bloc.dart';
// import '../model/notification_model.dart';

// class TransferkDetailsView extends StatelessWidget {
//   final Transfer tansfer;
//   const TransferkDetailsView({super.key, required this.tansfer});

//   @override
//   Widget build(BuildContext context) {
//     return AppLayout(
//       title: 'Plan Details',
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 125.w),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               _buildDetailRow('Id', tansfer.id.toString()),
//               _buildDetailRow('Status', tansfer.status!),
//               _buildDetailRow('Amount', tansfer.amount.toString()),
//               _buildDetailRow('User', tansfer.userId.toString()),
//               _buildDetailRow(
//                   'Sender Currency', tansfer.senderCurrencyId.toString()),
//               _buildDetailRow(
//                   'Reciever Currency', tansfer.receiverCurrencyId.toString()),
//               _buildDetailRow('Wallet', tansfer.receiverCurrencyId.toString()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow(String title, String value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           '$title:',
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           value,
//           style: const TextStyle(fontSize: 16),
//         ),
//       ],
//     );
//   }
// }
