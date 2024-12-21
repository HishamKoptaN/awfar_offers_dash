import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class CustomMarkaItem extends StatelessWidget {
  const CustomMarkaItem({
    super.key,
    required this.radius1,
    required this.radius2,
    required this.imageUrl,
  });

  final double radius1, radius2;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius1,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        backgroundImage: NetworkImage(
          imageUrl,
        ),
        radius: radius2,
      ),
    );
  }
}
