import 'package:dratbasics/core/colors.dart';
import 'package:flutter/material.dart';

const String fontFamily = 'SuisseIntl';

class AppTextStyle {
  static const TextStyle titleBold = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontFamily: fontFamily,
  );

  static const TextStyle titleLight = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w100,
    color: AppColors.primary,
    fontFamily: fontFamily,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    fontFamily: fontFamily,
  );

  static const TextStyle titleSemiBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    fontFamily: fontFamily,
  );
}
