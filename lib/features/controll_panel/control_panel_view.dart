import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/functions/navigation.dart';
import '../../core/widgets/global_widgets.dart';
import '../../core/utils/app_colors.dart';
import '../categories/presentation/view/categories_view.dart';
import '../cities/present/view/cities_view.dart';
import '../countries/presentation/view/countries_view.dart';
import '../external_notifications/present/view/external_notifications_view.dart';
import '../notifications/present/view/notifications_view.dart';
import '../roles/present/view/roles_view.dart';
import '../stores/present/view/stores_view.dart';
import '../coupons/presentation/view/coupons_view.dart';
import '../users/present/view/users_view.dart';

class ControlPanelView extends StatefulWidget {
  const ControlPanelView({
    super.key,
  });
  @override
  _ControlPanelViewState createState() => _ControlPanelViewState();
}

class _ControlPanelViewState extends State<ControlPanelView> {
  int? selectedIndex;
  List<Widget> pages = [
    const CategoriesView(),
    const StoresView(),
    const CitiesView(),
    const CountriesView(),
    const CouponsView(),
    const NotificationsView(),
    const ExternalNotificationsView(),
    const UsersView(),
    const RolesView(),
  ];
  List<String> titles = [
    'الفئات',
    'المتاجر',
    'المدن',
    'الدول',
    'الكوبونات',
    'الاشعارات',
    'الاشعارات الخارجية',
    'المستخدمين',
    'الصلاحيات',
  ];
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    setState(() {});
  }

  @override
  Widget build(
    context,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: CustomText(
          text: titles[selectedIndex ?? 0],
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.darkPrimaryColor,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: CustomText(
                  text: 'قائمة التحكم',
                  fontSize: 35.sp,
                  color: AppColors.white,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.local_offer),
                title: CustomText(
                  text: 'فئات',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 0;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart_outlined),
                title: CustomText(
                  text: 'متاجر',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 1;
                    },
                  );
                  Navigator.pop(
                    context,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_city),
                title: CustomText(
                  text: 'المدن',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 2;
                    },
                  );
                  Navigator.pop(
                    context,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.public),
                title: CustomText(
                  text: 'الدول',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 3;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.public),
                title: CustomText(
                  text: 'الكوبونات',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 4;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.public),
                title: CustomText(
                  text: 'الاشعارات',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 5;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.public),
                title: CustomText(
                  text: 'الاشعارات الخارجية',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 6;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.public),
                title: CustomText(
                  text: 'المستخدمين',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 7;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.public),
                title: CustomText(
                  text: 'الصلاحيات',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 8;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 25.sp,
                ),
                title: CustomText(
                  text: 'تسجل خروج',
                  fontSize: 27.5.sp,
                  color: AppColors.black,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: SizedBox(
                          height: 300.h,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Center(
                              child: CustomText(
                                text: "تسجيل خروج",
                                color: Colors.blue,
                                fontSize: 17.5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Column(
                              mainAxisSize:
                                  MainAxisSize.min, // يجعل الحجم يطابق المحتوى
                              children: [
                                CustomText(
                                  text: "هل انت متأكد",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                const Divider(thickness: 1),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () async {
                                          customNavigation(
                                            context: context,
                                            path: '/LoginView',
                                          );
                                        },
                                        child: CustomText(
                                          text: "تسجيل خروج",
                                          color: Colors.blue,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: CustomText(
                                          text: "أغلاق",
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: pages[selectedIndex!],
    );
  }
}
