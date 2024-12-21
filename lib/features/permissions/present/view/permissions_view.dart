// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:gap/gap.dart';
// import '../../../../../../core/utils/app_colors.dart';
// import '../../../../core/helpers/shared_pref_helper.dart';
// import '../../../../core/widgets/custom_text_widget.dart';
// import 'package:aquan_dash/features/deposits/present/view/deposits_view.dart';
// import '../../../auth/login/present/view/login_view.dart';
// import '../../../accounts/present/view/accounts_view.dart';
// import '../../../rates/present/view/rates_view.dart';
// import '../../../notifications/present/view/notifications_view.dart';
// import '../../../plans/present/view/plans_view.dart';
// import '../../../plans_invoices/present/view/plans_invoices_view.dart';
// import '../../../support/present/view/support_view.dart';
// import '../../../tasks/present/view/tasks_view.dart';
// import '../../../tasks_proofs/present/view/task_proofs_view.dart';
// import '../../../transfers/present/view/transfers_view.dart';
// import '../../../users/present/view/users_view.dart';
// import '../../../withdraws/present/view/withdraws_view.dart';
// import '../../../../generated/l10n.dart';

// class PermissionsView extends StatefulWidget {
//   PermissionsView({
//     required this.index,
//     super.key,
//   });

//   int? index;
//   @override
//   _PermissionsViewState createState() => _PermissionsViewState();
// }

// class _PermissionsViewState extends State<PermissionsView> {
//   int? selectedIndex;
//   List<Widget> pages = [
//     const MyAccountsView(),
//     const PlansView(),
//     const DepositsView(),
//     const WithdrawsView(),
//     const TransfersView(),
//     const PlansInvoicesView(),
//     const TasksView(),
//     const UsersView(),
//     const NotificationsView(),
//     const RatesView(),
//     const TaskProofsView(),
//     const SupportView(),
//     // ChatView(
//     //   chatId: 4,),
//     // ControllerView(),
//     // if (kDebugMode) UserImagePage(),
//   ];
//   List<String> titles = [
//     'الحسابات',
//     'الخطط',
//     'سجل الايداع',
//     'سجل السحب',
//     'سجل التحويل',
//     'أثبات الخطط',
//     'المهام',
//     'المستخدمين',
//     'الاشعارات',
//     'الاسعار',
//     'اثبات المهام',
//     'الدعم',
//   ];
//   @override
//   void initState() {
//     super.initState();
//     selectedIndex = widget.index;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     final t = S.of(context);
//     return Scaffold(
//       backgroundColor: AppColors.amber,
//       appBar: AppBar(
//         backgroundColor: AppColors.amber,
//         title: CustomText(
//           text: titles[selectedIndex ?? 0],
//           fontSize: 30.sp,
//           fontWeight: FontWeight.bold,
//           color: AppColors.white,
//         ),
//         centerTitle: true,
//       ),
//       drawer: Drawer(
//         child: SingleChildScrollView(
//           child: ListView(
//             shrinkWrap: true,
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 decoration: const BoxDecoration(
//                   color: AppColors.primaryColor,
//                 ),
//                 child: CustomText(
//                   text: "ألاقسام",
//                   fontSize: 35.sp,a
//                   color: AppColors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               buildListTile(
//                 title: 'الحسابات',
//                 index: 0,
//                 context: context,
//                 leading: Icon(
//                   Icons.account_balance,
//                   size: 25.sp,
//                 ),
//               ),
//               buildListTile(
//                 title: 'الخطط',
//                 index: 1,
//                 context: context,
//                 leading: Icon(
//                   FontAwesomeIcons.calendarCheck,
//                   size: 25.sp,
//                 ),
//               ),
//               buildListTile(
//                 title: 'سجل الايداع',
//                 index: 2,
//                 context: context,
//                 leading: Icon(
//                   Icons.arrow_downward,
//                   size: 25.sp,
//                 ),
//               ),
//               buildListTile(
//                 title: 'سجل السحب',
//                 index: 3,
//                 context: context,
//                 leading: Icon(
//                   Icons.arrow_upward,
//                   size: 25.sp,
//                 ),
//               ),
//               buildListTile(
//                 title: 'سجل التحويل',
//                 index: 4,
//                 context: context,
//                 leading: Icon(
//                   Icons.swap_horiz,
//                   size: 25.sp,
//                 ),
//                 //  FaIcon(FontAwesomeIcons.exchangeAlt),
//               ),
//               buildListTile(
//                 title: 'اثبات الخطط',
//                 index: 5,
//                 context: context,
//                 leading: Icon(
//                   Icons.receipt_long,
//                   // FontAwesomeIcons.receipt,
//                   size: 25.sp,
//                 ),
//               ),
//               buildListTile(
//                 title: 'المهام',
//                 index: 6,
//                 context: context,
//                 leading: Icon(Icons.fact_check),
//                 //  Icon(Icons.pending_actions),
//                 // Icon(Icons.task_alt),
//                 // FaIcon(FontAwesomeIcons.tasks),
//                 //  FaIcon(FontAwesomeIcons.clipboardCheck),
//                 //  FaIcon(FontAwesomeIcons.listCheck),
//                 // const Icon(Icons.timeline),
//                 // Icon(Icons.event_note),
//               ),
//               buildListTile(
//                 title: 'المستخدمين',
//                 index: 7,
//                 context: context,
//                 leading: Icon(
//                   Icons.people_alt_outlined,
//                   // FontAwesomeIcons.receipt,
//                   size: 25.sp,
//                 ),
//               ),
//               buildListTile(
//                 title: 'الاشعارات',
//                 index: 8,
//                 context: context,
//                 leading: Icon(
//                   Icons.notifications,
//                   // FontAwesomeIcons.receipt,
//                   size: 25.sp,
//                 ),
//               ),
//               buildListTile(
//                 title: 'الاسعار',
//                 index: 9,
//                 context: context,
//                 leading: FaIcon(
//                   FontAwesomeIcons.chartLine,
//                   size: 25.sp,
//                 ),

//                 // Icon(
//                 //   Icons.notifications,
//                 //   // FontAwesomeIcons.receipt,
//                 //   size: 25.sp,
//                 // ),
//               ),
//               buildListTile(
//                 title: 'أثبات المهام',
//                 index: 10,
//                 context: context,
//                 leading: FaIcon(
//                   FontAwesomeIcons.listCheck,
//                   size: 25.sp,
//                 ),
//               ),
//               buildListTile(
//                 title: 'الدعم',
//                 index: 11,
//                 context: context,
//                 leading: FaIcon(
//                   Icons.support_agent,
//                   size: 25.sp,
//                 ),
//                 // Icon(
//                 //   Icons.notifications,
//                 //   // FontAwesomeIcons.receipt,
//                 //   size: 25.sp,
//                 // ),
//               ),
//               Gap(
//                 50.h,
//               ),
//               ListTile(
//                 leading: Icon(
//                   Icons.logout,
//                   size: 25.sp,
//                 ),
//                 title: CustomText(
//                   text: 'تسجل خروج',
//                   fontSize: 27.5.sp,
//                   color: AppColors.black,
//                 ),
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         title: Center(
//                           child: CustomText(
//                             text: "تسجيل خروج",
//                             color: Colors.blue,
//                             fontSize: 17.5.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         content: Column(
//                           children: [
//                             CustomText(
//                               text: "هل انت متأكد",
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.bold,
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(height: 20),
//                             const Divider(thickness: 1),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Expanded(
//                                   child: TextButton(
//                                     onPressed: () async {
//                                       await SharedPrefHelper
//                                           .clearAllSecuredData();
//                                       Navigator.of(context).pushAndRemoveUntil(
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               const LoginView(),
//                                         ),
//                                         (route) => false,
//                                       );
//                                     },
//                                     child: CustomText(
//                                       text: "تسجيل خروج",
//                                       color: Colors.blue,
//                                       fontSize: 15.sp,
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 40,
//                                   width: 1,
//                                   color: Colors.grey,
//                                 ),
//                                 Expanded(
//                                   child: TextButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: CustomText(
//                                       text: "أغلاق",
//                                       fontSize: 15.sp,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Center(
//         child: pages[selectedIndex ?? 0],
//       ),
//     );
//   }

//   Widget buildListTile({
//     required String title,
//     required int index,
//     required BuildContext context,
//     required Widget leading,
//   }) {
//     return ListTile(
//       leading: leading,
//       title: CustomText(
//         text: title,
//         fontSize: 27.5.sp,
//         color: AppColors.black,
//       ),
//       onTap: () {
//         setState(
//           () {
//             selectedIndex = index;
//           },
//         );
//         Navigator.pop(context);
//       },
//     );
//   }
// }
// // const FaIcon(FontAwesomeIcons.dollarSign),
