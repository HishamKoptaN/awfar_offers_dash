import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/global/gobal_widgets/global_widgets.dart';
import '../../core/utils/app_colors.dart';
import '../categories/presentation/view/categories_view.dart';
import '../countries/presentation/view/countries_view.dart';
import '../governorates/presentation/pages/governorates_view.dart';
import '../offres/presentation/screens/offers_view.dart';
import '../stores/presentation/screens/stores_view.dart';
import '../sub_categories/presentation/view/sub_categories_view.dart';
import '../coupons/presentation/view/coupons_view.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({
    super.key,
  });
  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  int? selectedIndex;
  // قائمة الصفحات
  List<Widget> pages = [
    const OffersView(),
    const SubCategoriesView(),
    const CategoriesView(),
    const StoresView(),
    const GovernoratesView(),
    const CountriesView(),
    const CouponsView(),
  ];
  List<String> titles = [
    'العروض',
    'الفئات الفرعية',
    'الفئات',
    'المتاجر',
    'المحافظات',
    'الدول',
    'الكوبونات',
  ];
  @override
  void initState() {
    super.initState();
    selectedIndex = 2;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                  text: 'عروض',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 0; // تحديث الفهرس
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_offer),
                title: CustomText(
                  text: 'الفئات الفرعية',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 1; // تحديث الفهرس
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_offer),
                title: CustomText(
                  text: 'فئات',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
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
                  setState(() {
                    selectedIndex = 3; // تحديث الفهرس
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_city),
                title: CustomText(
                  text: 'المحافظات',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 4; // تحديث الفهرس
                  });
                  Navigator.pop(context);
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
                  setState(() {
                    selectedIndex = 5; // تحديث الفهرس
                  });
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
                  setState(() {
                    selectedIndex = 6;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: pages[selectedIndex ?? 0], // عرض الصفحة المناسبة
    );
  }
}
