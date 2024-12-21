// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/app_layout.dart';
// import '../../../../core/di/dependency_injection.dart';
// import '../../../../core/functions/navigation.dart';
// import '../../../../core/global/gobal_widgets/custom_button.dart';
// import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
// import '../../../../core/global/gobal_widgets/custom_data_cell.dart';
// import '../../../../core/global/gobal_widgets/custom_data_column.dart';
// import '../../../../core/global/gobal_widgets/global_widgets.dart';
// import '../../../../core/global/gobal_widgets/image_preview.dart';
// import '../../../../core/singletons/sub_categories_singletone.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../sub_categories/presentation/bloc/sub_categories_bloc.dart';
// import '../../../sub_categories/presentation/bloc/sub_categories_event.dart';
// import '../../../sub_categories/presentation/bloc/sub_categories_state.dart';

// class SubCategoryDetailsView extends StatelessWidget {
//   const SubCategoryDetailsView({
//     super.key,
//   });

//   @override
//   Widget build(
//     context,
//   ) {
//     final subCategories = SubCategoriesSingleton.instance.subCategories ?? [];
//     return MainLayout(
//       showAppBar: false,
//       route: '',
//       body: BlocProvider(
//         create: (context) => SubCategoriesBloc(
//           getIt(),
//           getIt(),
//           getIt(),
//           getIt(),
//           getIt(),
//         ),
//         child: BlocConsumer<SubCategoriesBloc, SubCategoriesState>(
//           listener: (context, state) async {
//             await state.whenOrNull(
//               success: () async {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text("نجاح"),
//                   ),
//                 );
//               },
//               failure: (apiErrorModel) async {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(apiErrorModel.error!),
//                   ),
//                 );
//               },
//             );
//           },
//           builder: (context, state) {
//             return state.maybeWhen(
//               loading: () {
//                 return CustomCircularProgress();
//               },
//               orElse: () {
//                 return SingleChildScrollView(
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: DataTable(
//                       dataRowHeight: 125.h,
//                       columns: [
//                         customDataColumn(
//                           label: 'معرف الدوله',
//                         ),
//                         customDataColumn(
//                           label: 'الاسم',
//                         ),
//                         customDataColumn(
//                           label: 'صورة الفئة الفرعية',
//                         ),
//                         customDataColumn(
//                           label: 'معرف الدوله',
//                         ),
//                         DataColumn(
//                           label: CustomTextButtonWidget(
//                             widget: state.maybeWhen(
//                               loading: () {
//                                 return CustomCircularProgress();
//                               },
//                               orElse: () {
//                                 return CustomText(
//                                   text: 'أضافة فئة فرعية',
//                                   fontSize: 30.sp,
//                                   color: AppColors.white,
//                                   maxLines: 1,
//                                   fontWeight: FontWeight.bold,
//                                 );
//                               },
//                             ),
//                             onPressed: () {
//                               customNavigation(
//                                 context: context,
//                                 path: '/AddSubCategoryView',
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                       rows: subCategories.map(
//                         (subCategory) {
//                           return DataRow(
//                             cells: [
//                               customDataCell(
//                                 label: subCategory.id.toString(),
//                               ),
//                               customDataCell(
//                                 label: subCategory.name.toString(),
//                               ),
//                               DataCell(
//                                 InkWell(
//                                   onTap: () async {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => ImageScreen(
//                                           imageUrl: subCategory.image!,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: CachedNetworkImage(
//                                     height: 100.h,
//                                     width: 100.w,
//                                     fit: BoxFit.fill,
//                                     imageUrl: subCategory.image!,
//                                     placeholder: (context, url) =>
//                                         const CircularProgressIndicator(),
//                                     errorWidget: (context, url, error) =>
//                                         const Icon(Icons.error),
//                                   ),
//                                 ),
//                               ),
//                               DataCell(
//                                 Padding(
//                                   padding: const EdgeInsets.all(1.0),
//                                   child: CustomTextButtonWidget(
//                                     onPressed: () {
//                                       customNavigation(
//                                         context: context,
//                                         path: '/EditSubCategoryView',
//                                         extra: subCategory,
//                                       );
//                                     },
//                                     text: 'تعديل',
//                                   ),
//                                 ),
//                               ),
//                               DataCell(
//                                 Padding(
//                                   padding: const EdgeInsets.all(1.0),
//                                   child: CustomTextButtonWidget(
//                                     widget: Icon(
//                                       Icons.delete,
//                                       color: Colors.red,
//                                       size: 35.sp,
//                                     ),
//                                     onPressed: () {
//                                       context.read<SubCategoriesBloc>().add(
//                                             SubCategoriesEvent.delete(
//                                               id: subCategory.id!,
//                                             ),
//                                           );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       ).toList(),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
