import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 24,
      ),
      color: AppColors.lightPrimaryColor,
    );
  }
}
