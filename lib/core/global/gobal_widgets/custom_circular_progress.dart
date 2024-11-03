import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomCircularProgress extends StatelessWidget {
  CustomCircularProgress({
    super.key,
    this.color = AppColors.white,
  });
  Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
