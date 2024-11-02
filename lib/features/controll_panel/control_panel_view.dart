import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/global/gobal_widgets/global_widgets.dart';
import '../../core/utils/app_colors.dart';
import '../categories/presentation/view/categories_view.dart';
import '../countries/presentation/view/countries_view.dart';
import '../governorates/presentation/pages/governorates_view.dart';
import '../offres/presentation/screens/offers_view.dart';
import '../stores/presentation/screens/stores_view.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({
    super.key,
  });
  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  int selectedIndex = 0;
  // قائمة الصفحات
  List<Widget> pages = [
    CountriesView(),
    const GovernoratesView(),
    const StoresView(),
    const CategoriesView(),
    const OffersView(),
  ];
  List<String> titles = [
    'الدول',
    'المحافظات',
    'المتاجر',
    'الفئات',
    'العروض',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: CustomText(
          text: titles[selectedIndex],
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
                leading: const Icon(Icons.public),
                title: CustomText(
                  text: 'الدول',
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
                leading: const Icon(Icons.location_city),
                title: CustomText(
                  text: 'المحافظات',
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
                leading: const Icon(Icons.shopping_cart_outlined),
                title: CustomText(
                  text: 'متاجر',
                  fontSize: 27.5.sp,
                  color: AppColors.darkPrimaryColor,
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 2; // تحديث الفهرس
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
                    selectedIndex = 3; // تحديث الفهرس
                  });
                  Navigator.pop(context);
                },
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
                    selectedIndex = 4; // تحديث الفهرس
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: pages[selectedIndex], // عرض الصفحة المناسبة
    );
  }
}
