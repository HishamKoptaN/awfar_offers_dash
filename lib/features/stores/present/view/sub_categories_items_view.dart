// import 'package:awfar_offer_app/core/utils/app_colors.dart';
// import 'package:awfar_offer_app/features/categories/presentation/views/widgets/app_bar_in_sub_category.dart';
// import 'package:awfar_offer_app/features/offers/presentation/views/widgets/store/custom_marka_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/di/dependency_injection.dart';
// import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
// import '../../../../core/models/product.dart';
// import '../../../../core/models/store.dart';
// import '../../../../core/models/sub_category.dart';
// import '../../../../core/singletons/products_singleton.dart';
// import '../../../../core/singletons/stores_singleton.dart';
// import '../../../../core/singletons/sub_categories_items_singleton.dart';
// import '../../../../core/widgets/custom_circular_progress.dart';
// import '../../../offer_details/presentation/views/store_deatails_view.dart';
// import '../../../products/presentation/bloc/products_bloc.dart';
// import '../../../products/presentation/bloc/products_event.dart';
// import '../../../products/presentation/bloc/products_state.dart';
// import '../../../sub_categories_items/presentation/bloc/sub_categories_items_bloc.dart';
// import '../../../sub_categories_items/presentation/bloc/sub_categories_items_event.dart';
// import '../../../sub_categories_items/presentation/bloc/sub_categories_state.dart';

// class SubCategoriesItemsView extends StatefulWidget {
//   const SubCategoriesItemsView({
//     super.key,
//     required this.subCategory,
//   });
//   final SubCategory subCategory;
//   static const String routeName = 'subCategoriesItemsView';

//   @override
//   State<SubCategoriesItemsView> createState() => _SubCategoriesItemsViewState();
// }

// class _SubCategoriesItemsViewState extends State<SubCategoriesItemsView> {
//   int selectedIndex = -1;
//   List<Product>? products;

//   @override
//   void initState() {
//     super.initState();
//     products = ProductsSingleton.instance.prdoucts;
//   }

//   @override
//   Widget build(context) {
//     double width = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             AppBarInSubCategory(
//               category: widget.subCategory,
//             ),
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(
//                       () {
//                         selectedIndex = -1;
//                         products = ProductsSingleton.instance.prdoucts;
//                       },
//                     );
//                   },
//                   child: Container(
//                     height: 35.w,
//                     decoration: BoxDecoration(
//                       color: selectedIndex == -1
//                           ? AppColors.lightPrimaryColor
//                           : AppColors.primaryColor,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 8),
//                       child: Text(
//                         "الكل ${ProductsSingleton.instance.prdoucts.length}",
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: SizedBox(
//                     height: 35.h,
//                     child: BlocProvider(
//                       create: (context) => SubCategoriesItemsBloc(
//                         getSubCategoriesItemsUseCase: getIt(),
//                       )..add(
//                           SubCategoriesItemsEvent.getSubCategoriesItems(
//                             subCategoryId: widget.subCategory.id!,
//                           ),
//                         ),
//                       child: BlocBuilder<SubCategoriesItemsBloc,
//                           SubCategoriesItemsState>(
//                         builder: (context, state) {
//                           return state.maybeWhen(
//                             loaded: () {
//                               return ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: SubCategoriesItemsSingleton
//                                     .instance.subCategoriesitems.length,
//                                 //      _selectedIndex == -1
//                                 // ? SubCategoriesItemsSingleton
//                                 //     .instance.subCategoriesitems.length
//                                 // : SubCategoriesItemsSingleton
//                                 //     .instance.subCategoriesitems
//                                 //     .where(
//                                 //       (i) => i.categoryId == _selectedIndex,
//                                 //     )
//                                 //     .toList()
//                                 //     .length,
//                                 itemBuilder: (context, index) {
//                                   final subCategoryItem =
//                                       SubCategoriesItemsSingleton
//                                           .instance.subCategoriesitems[index];
//                                   return GestureDetector(
//                                     onTap: () {
//                                       setState(
//                                         () {
//                                           products = ProductsSingleton
//                                               .instance.prdoucts
//                                               .where(
//                                                 (product) =>
//                                                     product.subCategoryItemId ==
//                                                     subCategoryItem.id,
//                                               )
//                                               .toList();
//                                           selectedIndex = index;
//                                         },
//                                       );
//                                     },
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                         right: 8,
//                                       ),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           color: selectedIndex == index
//                                               ? AppColors.lightPrimaryColor
//                                               : AppColors.primaryColor,
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           border: Border.all(
//                                             color: AppColors.lightPrimaryColor,
//                                           ),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 8),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 subCategoryItem.name!,
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 14.sp,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               const SizedBox(
//                                                 width: 4,
//                                               ),
//                                               Text(
//                                                 subCategoryItem.productsCunt
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 17.sp,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                             orElse: () {
//                               return const CustomCircularProgress();
//                             },
//                             loading: () {
//                               return const CustomCircularProgress();
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             // SizedBox(
//             //   height: 40.h,
//             //   child: BlocProvider(
//             //     create: (context) => ProductsBloc(
//             //       getProductsUseCase: getIt(),
//             //     )..add(
//             //         ProductsEvent.getProducts(
//             //           subCategoryId: subCategory.id!,
//             //         ),
//             //       ),
//             //     child: ListView.builder(
//             //       scrollDirection: Axis.horizontal,
//             //       itemCount: 10,
//             //       itemBuilder: (context, index) {
//             //         return Padding(
//             //           padding: const EdgeInsets.only(
//             //             right: 8,
//             //           ),
//             //           child: Stack(
//             //             children: [
//             //               CircleAvatar(
//             //                 radius: 23,
//             //                 backgroundColor: Colors.white,
//             //                 child: index != 0
//             //                     ? const CircleAvatar(
//             //                         backgroundColor: AppColors.primaryColor,
//             //                         backgroundImage: NetworkImage(
//             //                           "",
//             //                         ),
//             //                         radius: 22,
//             //                       )
//             //                     : const CircleAvatar(
//             //                         backgroundColor: AppColors.primaryColor,
//             //                         radius: 22,
//             //                         child: Text(
//             //                           "جميع",
//             //                           style: TextStyle(
//             //                             color: AppColors.lightPrimaryColor,
//             //                             fontSize: 12,
//             //                             fontWeight: FontWeight.w600,
//             //                           ),
//             //                         ),
//             //                       ),
//             //               ),
//             //               Positioned(
//             //                 right: 2,
//             //                 top: 0,
//             //                 child: Container(
//             //                   decoration: BoxDecoration(
//             //                     color: AppColors.yellowColor,
//             //                     borderRadius: BorderRadius.circular(16),
//             //                   ),
//             //                   child: const Padding(
//             //                     padding: EdgeInsets.all(4),
//             //                     child: Text(
//             //                       "98",
//             //                       style: TextStyle(
//             //                         fontSize: 9,
//             //                         color: Colors.black,
//             //                       ),
//             //                     ),
//             //                   ),
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //         );
//             //       },
//             //     ),
//             //   ),
//             // ),
//             const SizedBox(
//               height: 8,
//             ),
           
//           ],
//         ),
//       ),
//     );
//   }
// }
