import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class TextStyles {
  static const TextStyle normal10 = TextStyle(
    color: AppColors.yellowColor,
    fontSize: 10,
  );
  static const TextStyle normal14 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );
  static const TextStyle bold14 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.white,
  );
  static const TextStyle bold13 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );

  static const TextStyle bold16 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextStyle bold18 = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bold19 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 19,
  );
}
