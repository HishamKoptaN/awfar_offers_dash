import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global/gobal_widgets/global_widgets.dart';

class MainLayout extends StatefulWidget {
  MainLayout({
    super.key,
    required this.route,
    required this.body,
    required this.showAppBar,
    this.backArow = true,
    this.onPressed,
  });
  final String route;
  final Widget body;
  final bool showAppBar;
  final bool backArow;
  void Function()? onPressed;
  @override
  State<MainLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: widget.showAppBar
            ? AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: CustomText(
                  text: widget.route,
                  color: Colors.black,
                  fontSize: 30.sp,
                ),
                centerTitle: true,
              )
            : null,
        body: widget.body,
      ),
    );
  }
}
