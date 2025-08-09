import 'package:dratbasics/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String fontFamily = 'SuisseIntl';

class AppTextStyle {
  static TextStyle titleBold = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontFamily: fontFamily,
  );

  static TextStyle titleLight = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w100,
    color: AppColors.primary,
    fontFamily: fontFamily,
  );

  static TextStyle titleMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    fontFamily: fontFamily,
  );

  static TextStyle titleSemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    fontFamily: fontFamily,
  );
}
