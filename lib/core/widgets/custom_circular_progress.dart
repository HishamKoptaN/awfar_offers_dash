import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomCircularProgress extends StatelessWidget {
  CustomCircularProgress({
    super.key,
    this.color = AppColors.darkPrimaryColor,
  });
  Color color;
  @override
  Widget build(context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
