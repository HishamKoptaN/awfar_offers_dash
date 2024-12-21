import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/global_widgets.dart';
import 'utils/app_colors.dart';

class MainLayout extends StatefulWidget {
  MainLayout({
    super.key,
    this.route,
    required this.body,
    this.leading,
    required this.showAppBar,
    this.backArow = true,
    this.onPressed,
  });
  final String? route;
  final Widget body;
  final bool showAppBar;
  final bool backArow;
  final Widget? leading;
  void Function()? onPressed;
  @override
  State<MainLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<MainLayout> {
  @override
  Widget build(
    context,
  ) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: widget.showAppBar
            ? AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                title: CustomText(
                  text: widget.route ?? '',
                  color: Colors.black,
                  fontSize: 30.sp,
                ),
                leadingWidth: 40.w,
                leading: widget.leading ??
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 24.sp,
                          ),
                        ),
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
              )
            : null,
        body: widget.body,
      ),
    );
  }
}
