import 'package:flutter/material.dart';

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
                title: Text(
                  widget.route,
                  style: const TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              )
            : null,
        body: widget.body,
      ),
    );
  }
}
